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
    }
  

  }]);
}());