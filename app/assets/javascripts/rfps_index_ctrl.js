(function() {
  "use strict";

  angular.module("app").controller("rfpsIndexCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    $scope.descending = false;
    $scope.toggle_class = "glyphicon glyphicon-triangle-top";

    //GET CURRENT USER ID USING GON GEM
    $scope.currentUserId = gon.current_user_id;

    $scope.setup = function(){

      $http.get('/api/v1/rfps.json').then(function(response){
        $scope.rfps = response.data;
      });

      $http.get('/api/v1/rfp_questions.json').then(function(response){
        $scope.rfp_questions = response.data;

      });

    };

    $scope.setupShow = function(){
      $scope.activeId = gon.id;
      
      $http.get('/api/v1/rfps/' + $scope.activeId + '.json').then(function(response){
          $scope.sections = response.data;
          console.log($scope.sections);
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

    $scope.formatAnswer = function(rfpForm, rfpQuestionId){
      var subAnswerFormat = [];
      var answerOutput = rfpForm.rfp_answers;

      if(rfpQuestionId){
        for(var i =  0; i < rfpForm.rfp_answers.length; i++){
          if(rfpForm.rfp_answers[i].rfp_question_id === rfpQuestionId){
            if(rfpForm.rfp_answers[i].rfp_answer === "See Subs"){
              for(var j = 0; j < rfpForm.rfp_answers[i].sub_answers.length; j++){
                subAnswerFormat.push(rfpForm.rfp_answers[i].sub_answers[j].sub_question + ":  " + rfpForm.rfp_answers[i].sub_answers[j].sub_answer);
              }
            }
            else{
              subAnswerFormat.push(rfpForm.rfp_answers[i].rfp_answer);
            }
          }
        }
      }

      return subAnswerFormat;
    };

    //THIS FUNCTION JUST CHECKS TO SEE IF THE RFP HAS ALREADY BEEN RATED
    $scope.rated = function(ratings){
      if (ratings.length > 0){
        for (var i=0; i < ratings.length; i++){
          // console.log("id: " + ratings[i].user_id);
          if (ratings[i].user_id == $scope.currentUserId){
            // $scope.activeRatingId = ratings[i].id;
            return true;
          };
        };
      };
      return false;
    };

    //THIS FUNCTION JUST AVERAGES UP THE RATINGS FOR EACH RFP
    $scope.avgRatingPerRfp = function(ratings){
      console.log(ratings)
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


  }]);
}());