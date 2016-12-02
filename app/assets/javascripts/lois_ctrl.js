(function() {
  "use strict";

  angular.module("app").controller("loisCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile) {
      window.scope = $scope;

      //GET ACTIVE ID USING THE GON GEM
      // activeID or
      $scope.activeId = gon.loi_id;

      $scope.setup = function(){

        $http.get('/api/v1/lois/' + $scope.activeId + '.json').then(function(response){
          $scope.loi = response.data;
          console.log($scope.loi);

          //ADD THE TOTAL FTES
          $scope.fte_1 = 0;
          $scope.fte_2 = 0;
          $scope.fte_3 = 0;

          for(var i = 0; i < $scope.loi.challenge_answers.length; i++){
            $scope.fte_1 = $scope.loi.challenge_answers[i].fte.amount_1 ?
              ($scope.fte_1 + parseFloat($scope.loi.challenge_answers[i].fte.amount_1)) :
              ($scope.fte_1);
            $scope.fte_2 = $scope.loi.challenge_answers[i].fte.amount_2 ?
              ($scope.fte_2 + parseFloat($scope.loi.challenge_answers[i].fte.amount_2)) :
              ($scope.fte_2);
            $scope.fte_3 = $scope.loi.challenge_answers[i].fte.amount_3 ?
              ($scope.fte_3 + parseFloat($scope.loi.challenge_answers[i].fte.amount_3)) :
              ($scope.fte_3);
          };

        });

        
      };

  }]);
 
}());