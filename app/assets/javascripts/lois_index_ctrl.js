//THIS IS THE ANGULAR CONTROLLER FOR THE LOI INDEX PAGE

(function() {
  "use strict";

  angular.module("app").controller("loisIndexCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    //GET CURRENT USER ID USING GON GEM
    $scope.currentUserId = gon.current_user_id;

    // $scope.activeRatingId = "";
    $scope.descending = false;

    $scope.setup = function(){

      $http.get('/api/v1/lois.json').then(function(response){
        $scope.lois = response.data;
        console.log($scope.lois[0].ratings)
      });

      $http.get('/api/v1/questions.json').then(function(response){
        $scope.questions = response.data;
      });
    
    };

    $scope.sortBy = function(sortAttribute){
      $scope.sortByAttribute = sortAttribute;
      $scope.descending = !$scope.descending;
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
      for (var i=0; i < ratings.length; i++){
        if (ratings[i].user_id == $scope.currentUserId){
          $scope.activeRatingId = ratings[i].id;
          return true;
        } else {
          return false;
        };
      };
    };

    //THIS FUNCTION JUST AVERAGES UP THE RATINGS FOR EACH LOI
    $scope.avgRatingPerLoi = function(ratings){
      if (ratings.length > 0){
        var score = 0;
        for (var i=0; i < ratings.length; i++){
          console.log(score);
          score = score + parseFloat(ratings[i].weighted_score);
        };
        return (score/ratings.length).toFixed(2);
      } else {
        return "No Ratings";
      }
    };

  }]);

}());