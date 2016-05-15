(function() {
  "use strict";

  angular.module("app").controller("ratingsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    $scope.descending = false;

    $scope.setup = function(){

      $http.get('/api/v1/ratings.json').then(function(response){
        $scope.ratings = response.data;
        console.log($scope.ratings);

        $scope.averageQ1 = 0;
        $scope.averageQ2 = 0;
        $scope.averageQ3 = 0;
        $scope.averageQ4 = 0;
        
        $scope.averageWeightedScore = 0;

        for (var i=0; i<$scope.ratings.length; i++){
          $scope.averageQ1 = $scope.averageQ1 + $scope.ratings[i].q1;
          // $scope.averageQ2 = $scope.averageQ2 + $scope.ratings[i].q2;
          // $scope.averageQ3 = $scope.averageQ3 + $scope.ratings[i].q3;
          // $scope.averageQ4 = $scope.averageQ4 + $scope.ratings[i].q4;
          // $scope.averageWeightedScore =  $scope.averageWeightedScore + $scope.ratings[i].weighted_score;
        };
      });
    };

    $scope.sortBy = function(sortAttribute){
      console.log(sortAttribute);
      $scope.sortByAttribute = sortAttribute;
      $scope.descending = !$scope.descending;
    };

    $scope.average = function() {
      $scope.averageQ1 = 0;
      $scope.averageQ2 = 0;
      $scope.averageQ3 = 0;
      $scope.averageQ4 = 0;
      $scope.averageQ5 = 0;
      $scope.averageWeightedScore = 0;
      for (var i=0; i<$scope.ratings.length; i++){
        $scope.averageQ1 =  $scope.averageQ1 + $scope.ratings[i].q1;
        $scope.averageQ2 = $scope.averageQ2 + $scope.ratings[i].q2;
        $scope.averageQ3 = $scope.averageQ3 + $scope.ratings[i].q3;
        $scope.averageQ4 = $scope.averageQ4 + $scope.ratings[i].q4;
        $scope.averageWeightedScore =  $scope.averageWeightedScore + $scope.ratings[i].weighted_score;
      };
    };

  }]);
}());