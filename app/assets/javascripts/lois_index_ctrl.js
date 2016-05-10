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
    //** check api/v1/lois.json to see format **//
    //** answer[0] are the challenges and answer[1] are the FTEs **// 
    $scope.formatAnswer = function(answer){
      if (Array.isArray(answer)){
      console.log(answer);
        var challenges = [];
        for (var i=0; i<answer[0].length; i++){
          if (answer[0][i].challenge != ""){
            challenges.push(answer[0][i].challenge + " - Priority: " + answer[0][i].priority);
          };
        };
        if (answer[1].amount_1 != null){
          challenges.push("FTES - 2015: " + answer[1].amount_1 + ", 2016: " + answer[1].amount_2 + ", 2017: " + answer[1].amount_2);
        };
        console.log(challenges);
        return challenges;
      } else {
        return [answer];
      };

    };

  }]);

}());