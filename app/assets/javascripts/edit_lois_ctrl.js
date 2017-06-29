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

          $scope.activeChallenge = {};
          //ADD THE TOAL FTES
          $scope.fte_1 = 0.0;
          $scope.fte_2 = 0.0;
          $scope.fte_3 = 0.0;

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

    $scope.addFte = function(){
      $scope.fte_1 = 0.0;
      $scope.fte_2 = 0.0;
      $scope.fte_3 = 0.0;
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
    };

    //SETS TO TRUE IF APPLICANT IS FINISHED WITH LOI FORM
    $scope.submitNow = function(){
      $scope.submitted = true;
    };

    $scope.addChallenge = function(questionId){
      if ($scope.activeChallenge[questionId] == 1){
        $scope.activeChallenge[questionId] = 2;
      } else {
        $scope.activeChallenge[questionId] = 1;
      }
      console.log($scope.activeChallenge);
    };

    $scope.wordCount = function(text){
      var wordLength = text ? text.match(/\S+/g).length : 0;
      return wordLength >= 100 ? 'Too Long!' : wordLength;
    }

    $scope.submit = function(name, email, isValid){
      
      if ($scope.submitted) {
        var areYouSure = confirm("Do you want to Submit? Once the LOI has been submitted it is no longer allowed to be edited. If you need to edit the LOI later, please use the 'Save and Submit Later' button.");
        if (!areYouSure){
          $scope.submitted = false;
          return;
        }
      }
      console.log(name);
      console.log(email);
      console.log(isValid);

      if (isValid) {
        var newLoi = {
          name: $scope.loi.name,
          email: $scope.loi.email,
          submitted: $scope.submitted,
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

        $http.patch('/api/v1/lois/' + $scope.activeId + '.json', newLoi).then(function(response){
          console.log(response);
          if (response.status === 201)
          {
            $(".alert").empty();
            window.location = '/lois?alert='+response.data.message;
  
          } else {
            window.location = '/thanks/' + response.data.loi_id;
          }
        });

      } else {
        alert("Form is invalid. See area marked in red.");
      }

    };

  }]);

}());