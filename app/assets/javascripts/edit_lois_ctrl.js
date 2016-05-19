(function() {
  "use strict";

  angular.module("app").controller("editLoisCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile)
    {
      window.scope = $scope;

      //GET ACTIVE ID USING THE GON GEM
      $scope.activeId = gon.loi_id;

      $scope.submitted = false;

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
      };

    //SETS TO TRUE IF APPLICANT IS FINISHED WITH LOI FORM
    $scope.submitNow = function(){
      $scope.submitted = true;
    };

    $scope.submit = function(isValid){

  
      if (1) {

        var newLoi = {
          name: $scope.loi.name,
          email: $scope.loi.email,
          contact_answers: $scope.loi.contact_answers,
          organization_answers: $scope.loi.organization_answers,
          overview_answers: $scope.loi.overview_answers,
          vision_answers: $scope.loi.vision_answers,
          concern_answers: $scope.loi.concern_answers,
          challenge_answers: $scope.loi.challenge_answers,
          referral_answers: $scope.loi.referral_answers,
          demographic_answers: $scope.loi.demographic_answers,
          geographic_answers: $scope.loi.geographic_answers
        };

      console.log(newLoi);

        $http.patch('/api/v1/lois/' + $scope.activeId + '.json', newLoi).then(function(response){
            console.log(response.data.loi_id);
            window.location = '/thanks/' + response.data.loi_id;
          });

      } else {
        alert("Form is invalid");
      };

    };

  }]);
 
}());