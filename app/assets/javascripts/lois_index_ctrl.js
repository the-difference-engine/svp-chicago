//THIS IS THE ANGULAR CONTROLLER FOR THE LOI INDEX PAGE

(function() {
  "use strict";

  angular.module("app").controller("loisIndexCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    //GET CURRENT USER ID USING GON GEM
    $scope.currentUserId = gon.current_user_id;

    // $scope.activeRatingId = "";
    $scope.descending = false;
    $scope.toggle_class = "glyphicon glyphicon-triangle-top";
    $scope.btnText = "Invite to RFP";

    $scope.setup = function(){

      $http.get('/api/v1/lois.json').then(function(response){
        $scope.lois = response.data;

        if ($scope.lois.length > 0){
          for (var i=0; i<$scope.lois.length; i++){
            $scope.lois[i].avgRatingPerLoi = $scope.avgRatingPerLoi($scope.lois[i].ratings);
          }
        }
      });

      $http.get('/api/v1/questions.json').then(function(response){
        $scope.questions = response.data;
      });

      $http.get('/api/v1/invited_lois.json').then(function(response) {
        $scope.invited_lois = response.data;

      });

    };

    $scope.sortBy = function(sortAttribute){
      $scope.sortByAttribute = sortAttribute;
      $scope.descending = !$scope.descending;

      if($scope.descending){
        $scope.toggle_class = "glyphicon glyphicon-triangle-bottom";
      }
      else if(!$scope.descending){
        $scope.toggle_class = "glyphicon glyphicon-triangle-top"
      }
    };

    //THIS FUNCTION HELPS FORMAT THE ANSWERS FROM THE NG-SELECT
    //NEED THIS TO FORMAT THE SEPARATE CHALLEGES FROM THE ORGANIZATIONAL CAPACITY CHALLENGES SECTION
    //** check api/v1/lois.json to see format **//
    //** answer[0] are the challenges and answer[1] are the FTEs **//
    $scope.formatAnswer = function(answer){
      if (Array.isArray(answer)){
        var challenges = [];
        for (var i=0; i<answer[0].length; i++){
          if (answer[0][i].challenge != ""){
            challenges.push(answer[0][i].challenge + " - Priority: " + answer[0][i].priority);
          };
        };
        if (answer[1].amount_1 != null){
          challenges.push("FTES - 2015: " + answer[1].amount_1 + ", 2016: " + answer[1].amount_2 + ", 2017: " + answer[1].amount_2);
        };
        return challenges;
      } else {
        return [answer];
      };

    };

    //THIS FUNCTION JUST CHECKS TO SEE IF THE LOI HAS ALREADY BEEN RATED
    $scope.rated = function(ratings){
      if (ratings.length > 0){
        for (var i=0; i < ratings.length; i++){
          // console.log("id: " + ratings[i].user_id);
          if (ratings[i].user_id == $scope.currentUserId){
            $scope.activeRatingId = ratings[i].id;
            return true;
          };
        };
      };
      return false;
    };

    //THIS FUNCTION JUST AVERAGES UP THE RATINGS FOR EACH LOI
    $scope.avgRatingPerLoi = function(ratings){
      if (ratings.length > 0){
        var score = 0;
        for (var i=0; i < ratings.length; i++){
          score = score + parseFloat(ratings[i].weighted_score);
        };
        return (score/ratings.length).toFixed(2);
      } else {
        return "No Ratings";
      }
    };

    $scope.inviteSent = function(status, loi_id){
      var dupes = $scope.invited_lois.filter(function(invited_lois) {
        return invited_lois.loi_id === parseInt(loi_id);
      });
      if (dupes.length === 0) {
        var updatedStatus = {
          status: true,
          loi_id: loi_id,
        };

        $http.post('/api/v1/invited_lois/', updatedStatus).then(function(response){
          console.log(response.data);
          $scope.invited_lois.push(response.data);
        });

      } else {
        alert("error");
      }
    };

    $scope.changeReject = function(inputLOI)

      {
        var confirmation = confirm("Are you Sure");
        if (!confirmation){
          return
        }

        if (inputLOI.reject === false) {
          inputLOI.reject = true;
          var rejectStatus = {
            reject: inputLOI.reject,
            loi_id: inputLOI.id,
          }
         $http.patch('/lois/' + inputLOI.id, rejectStatus).then(function(response){
            console.log(response.data);
             for (var i=0; i < $scope.lois.length; i++) {
                if ($scope.lois[i].id == inputLOI.id) {
                  $scope.lois.splice(i);
                }
          };
        });
      }
    };

    $scope.changeBtn = function(repeatScope) {
      if (repeatScope.isDisabled) {
        repeatScope.isDisabled = false;
      } else {
        repeatScope.btnText = "Invited";
        repeatScope.isDisabled = true;
      }
    };


  }]);

}());