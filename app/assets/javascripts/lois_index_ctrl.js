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

  }]);

}());