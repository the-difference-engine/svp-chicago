(function() {
  "use strict";

  angular.module("app")

  .filter('avgOfValue', function () {
    return function (data, key) {
        if (angular.isUndefined(data) && angular.isUndefined(key))
            return 0;        
        var sum = 0;

        var i = 0;
        angular.forEach(data,function(v,k){
            sum = sum + parseInt(v[key]);
            i++;
        });        
        return (sum/i);
    }
})

  .controller("ratingsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    $scope.descending = false;
    $scope.setup = function(){

      $http.get('/api/v1/ratings.json').then(function(response){
        $scope.ratings = response.data;
      });
    };

    $scope.sortBy = function(sortAttribute){
      $scope.sortByAttribute = sortAttribute;
      $scope.descending = !$scope.descending;
    };

  }]);
}());

