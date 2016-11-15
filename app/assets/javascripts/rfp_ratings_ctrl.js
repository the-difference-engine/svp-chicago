(function() {
  "use strict";


  angular.module("app").controller("RfpRatingsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    //GET CURRENT USER ID USING GON GEM
    $scope.currentUserId = gon.current_user_id;
    $scope.descending = false;
    $scope.toggle_class = "glyphicon glyphicon-triangle-top";

    $scope.setup = function(){
      $http.get('/api/v1/rfp_ratings.json').then(function(response){
        $scope.rfp_ratings = response.data;
        console.log(response);
        console.log($scope.rfp_ratings);
      });
    };

    $scope.sortBy = function(sortAttribute){
      $scope.sortByAttribute = sortAttribute;
      $scope.descending = !$scope.descending;

      if($scope.descending){
        $scope.toggle_class = "glyphicon glyphicon-triangle-bottom";
      }
      else if(!$scope.descending){
        $scope.toggle_class = "glyphicon glyphicon-triangle-top";
      }
    };

  }]);
}());