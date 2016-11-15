(function() {
  "use strict";


  angular.module("app")

  // THIS FILTER IS USED TO DISPLAY THE AVERAGE OF THE RATINGS
  // UPDATING DYNAMICALLY AS THE LIST IS FILTERED
  .filter('avgOfValue', function () {
    return function (data, key) {
        if (angular.isUndefined(data) || (data.length == 0)){
          return 0;
        } else {

          var sum = 0;
          var i = 0;

          angular.forEach(data,function(v,k){
            sum = sum + parseFloat(v[key]);
            i++;
          });

          return (sum/i).toFixed(2);
        }      
            
    }
  })

  .controller("RfpRatingsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
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