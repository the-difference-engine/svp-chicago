(function() {
  "use strict";

  angular.module("app").controller("rfpsIndexCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    $scope.activeId = gon.id;

    $scope.setup = function(){

      $http.get('/api/v1/rfps.json').then(function(response){
        $scope.rfp = response.data;

      });

      $http.get('/api/v1/rfps/' + $scope.activeId + '.json').then(function(response){
        $scope.sections = response.data;
        console.log($scope.sections);
      });

    };

  

  }]);
}());