(function() {
  "use strict";

  angular.module("app").controller("formsCtrl", function($scope, $http){
  	window.scope = $scope;
		$scope.setup = function(){
			$http.get('/api/v1/lois.json').then(function(response){
        console.log(response);
				$scope.recipes = response.data;
			});
		};
  });
}());