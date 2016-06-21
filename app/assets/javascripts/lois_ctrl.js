(function() {
  "use strict";

  angular.module("app").controller("loisCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile)
    {
      window.scope = $scope;

      //GET ACTIVE ID USING THE GON GEM
      $scope.activeId = gon.loi_id;

      $scope.setup = function(){

        $http.get('/api/v1/lois/' + $scope.activeId + '.json').then(function(response){
          $scope.loi = response.data;
          console.log($scope.loi);

          //ADD THE TOAL FTES
          $scope.fte_1 = 0;
          $scope.fte_2 = 0;
          $scope.fte_3 = 0;

          for(var i = 0; i < $scope.loi.challenge_answers.length; i++){
            $scope.fte_1 = $scope.fte_1 + $scope.loi.challenge_answers[i].fte.amount_1;
            $scope.fte_2 = $scope.fte_2 + $scope.loi.challenge_answers[i].fte.amount_2;
            $scope.fte_3 = $scope.fte_3 + $scope.loi.challenge_answers[i].fte.amount_3;
          };

        });

        
            //THIS SUBMIT FUNCTION ALLOWS AN ADMIN TO INVITE TO RFP DIRECTLY FROM THE RAINGS INDEX PAGE
        $scope.inviteSent = function(status, activeId){
          var updatedStatus = {
            status: status
          };
          $http.patch('/api/v1/lois/' + activeId + '.json', updatedStatus).then(function(response){
            console.log(response.data);
          });
        };
      
      };

  }]);
 
}());