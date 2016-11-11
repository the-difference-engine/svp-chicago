(function() {
  "use strict";


  angular.module("app").controller("RfpRatingsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    $scope.setup = function(){

      $http.get('/api/v1/rfp_ratings.json').then(function(response){
        $scope.rfp_ratings = response;
      });

    }

  }]);
}());