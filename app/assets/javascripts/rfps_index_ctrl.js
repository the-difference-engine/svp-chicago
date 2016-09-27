(function() {
  "use strict";

  angular.module("app").controller("rfpsIndexCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    // $scope.activeId = gon.id;

    $scope.descending = false;
    $scope.toggle_class = "glyphicon glyphicon-triangle-top";

    $scope.setup = function(){

      $http.get('/api/v1/rfps.json').then(function(response){
        $scope.rfps = response.data;
        console.log($scope.rfps);
      });

      $http.get('/api/v1/rfp_questions.json').then(function(response){
        $scope.rfp_questions = response.data;

      });

      // $http.get('/api/v1/rfps/' + $scope.activeId + '.json').then(function(response){
      //   $scope.sections = response.data;
      //   console.log($scope.sections);
      // });

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

    $scope.formatAnswer = function(answerToFormat){
      var subAnswerFormat = [];

      if (answerToFormat && answerToFormat.rfp_answer === "See Subs"){
        for(var i = 0; i < answerToFormat.sub_answers.length; i++){
          subAnswerFormat.push(answerToFormat.sub_answers[i].sub_question + ":  " + answerToFormat.sub_answers[i].sub_answer);
        }

        return subAnswerFormat;
      }
      else if(answerToFormat){
        subAnswerFormat.push(answerToFormat.rfp_answer);

        return subAnswerFormat;
      }
      // if (answerToFormat.sub_questions.length !== 0){

      // } else {
      //   answerToFormat["rfp_answer"]
      // }
      // if(answerToFormat === "See Subs"){
      //   return answerToFormat["sub_answers"];
      // }
      // else{
      //   return answerToFormat;
      // }
    };

  }]);
}());