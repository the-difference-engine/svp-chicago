(function() {
  "use strict";

  angular.module("app").controller("rfpsIndexCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    $scope.setup = function(){

      $http.get('/api/v1/rfps.json').then(function(response){
        $scope.rfps = response.data;

      });


    };

  

  }]);
}());