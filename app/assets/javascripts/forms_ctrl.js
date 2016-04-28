(function() {
  "use strict";

  angular.module("app").controller("formsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
  	window.scope = $scope;
		$scope.setup = function(){
			$http.get('/api/v1/lois.json').then(function(response){
				$scope.lois = response.data;
				console.log($scope.lois);
			});
		};
		$scope.setupRatings = function(){
			$http.get('/api/v1/ratings.json').then(function(response){
				$scope.ratings = response.data;
				console.log($scope.ratings);
			});
		};
		$scope.ratingFilter = function(){
			console.log("clicked!");
		};
  }]);
}());