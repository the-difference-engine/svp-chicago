//THIS IS THE ANGULAR CONTROLLER FOR THE LOI INDEX PAGE

(function() {
  "use strict";

  angular.module("app").controller("loisIndexCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    $scope.setup = function(){

      $http.get('/api/v1/lois.json').then(function(response){
        $scope.lois = response.data;
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
    $scope.formatAnswer = function(answer){
      if (Array.isArray(answer)){
      console.log(answer);
        var challenges = [];
        for (var i=0; i<answer.length; i++){
          challenges.push(answer[i].challenge + " - Priority: " + answer[i].priority);
        };
        console.log(challenges)
        return challenges;
      } else {
        return [answer];
      };

    };

  }]);

}());