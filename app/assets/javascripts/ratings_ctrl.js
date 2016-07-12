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
            sum = sum + parseInt(v[key]);
            i++;
          });

          return (sum/i).toFixed(2);
        }      
            
    }
})

  .controller("ratingsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    //GET CURRENT USER ID USING GON GEM
    $scope.currentUserId = gon.current_user_id;

    $scope.descending = false;

    $scope.setup = function(){
      $http.get('/api/v1/ratings.json').then(function(response){
        $scope.ratings = response.data;
        $scope.ratingsLength = response.data.length;

      });
      $http.get('/api/v1/invite_maxes/1.json').then(function(response){
        $scope.inviteMax = response.data;
        console.log($scope.inviteMax);

      });

      $http.get('/api/v1/ratings/yes_ratings.json').then(function(response){
        $scope.yourYesRatings = response.data;
        $scope.yourYesRatingsLength = response.data.length;
        console.log($scope.yourYesRatingsLength);

      });

    };

    $scope.sortBy = function(sortAttribute){
      $scope.sortByAttribute = sortAttribute;
      $scope.descending = !$scope.descending;
    };
    
    
    
    //THIS SUBMIT FUNCTION ALLOWS AN ADMIN TO INVITE TO RFP DIRECTLY FROM THE RAINGS INDEX PAGE
    $scope.submitInvite = function(q5, activeId){


      var updatedRating = {
        q5: q5
      };
      if (updatedRating.q5 === "Yes" && $scope.yourYesRatingsLength < $scope.inviteMax.max) {
        $http.patch('/api/v1/ratings/' + activeId + '.json', updatedRating).then(function(response){
          $scope.yourYesRatingsLength += 1;
          console.log("new length: " + $scope.yourYesRatingsLength);
        });


      } else if (updatedRating.q5 === "Yes" && $scope.yourYesRatingsLength === $scope.inviteMax.max) {
        alert ("blah");
        console.log("not adding");

      } else if ($scope.ratings.q5 === "Yes" && updatedRating.q5 === "No") {
        $http.patch('/api/v1/ratings/' + activeId + '.json', updatedRating).then(function(response){
          $scope.yourYesRatingsLength -= 1;
          console.log("new length: " + $scope.yourYesRatingsLength);

        });

      } else if ($scope.ratings.q5 === "Yes" && updatedRating.q5 === "Maybe") {
        $http.patch('/api/v1/ratings/' + activeId + '.json', updatedRating).then(function(response){
          $scope.yourYesRatingsLength -= 1;
          console.log("new length: " + $scope.yourYesRatingsLength);

        });
      
      } else if ($scope.ratings.q5 === "Maybe" && updatedRating.q5 === "No") {
        $http.patch('/api/v1/ratings/' + activeId + '.json', updatedRating).then(function(response){
          console.log("no");

        });
      
      } else if ($scope.ratings.q5 === "No" && updatedRating.q5 === "Maybe") {
        $http.patch('/api/v1/ratings/' + activeId + '.json', updatedRating).then(function(response){
          
          console.log("maybe");

        });
      }
      // } else if (updatedRating.q5 === "No" && $scope.yourYesRatingsLength >= $scope.inviteMax) {
      //   $http.patch('/api/v1/ratings/' + activeId + '.json', updatedRating).then(function(response){
      //     $scope.yourYesRatingsLength -= 1;
      //     console.log("new length: " + $scope.yourYesRatingsLength);

      //   });
      // } else if (updatedRating.q5 === "Maybe" && $scope.yourYesRatingsLength >= $scope.inviteMax){
      //     $scope.yourYesRatingsLength -= 1;
      //     console.log("new length: " + $scope.yourYesRatingsLength);
      // }
      
    };

  }]);
}());

