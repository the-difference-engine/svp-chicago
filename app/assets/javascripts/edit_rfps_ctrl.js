(function() {
  "use strict";

  angular.module("app").controller("editRfpsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile)
  {
    window.scope = $scope;

    $scope.setup = function(){
      $scope.activeId = gon.id;

      $scope.submitted = false;

      $http.get('/api/v1/rfps/' + $scope.activeId + '.json').then(function(response){
        $scope.sections = response.data;
        console.log($scope.sections);

      });
    };

    $scope.addInput = function(id){
      console.log(id);
      for(var i=0; i<$scope.sections.length;i++){
        for(var j=0; j<$scope.sections[i].rfp_questions.length;j++){
          if($scope.sections[i].rfp_questions[j].id==id){
            if($scope.sections[i].rfp_questions[j].question_type==="multiple input"){
              $scope.sections[i].rfp_questions[j].rfp_answers.push({});
            } else if ($scope.sections[i].rfp_questions[j].question_type==="block with multiple inputs"){
              for(var k=0; k<$scope.sections[i].rfp_questions[j].sub_questions.length; k++){
                $scope.sections[i].rfp_questions[j].sub_questions[k].sub_answers.push({});
              }
            }
          };
        };
      };
    };

    //SETS TO TRUE IF APPLICANT IS FINISHED WITH LOI FORM
    $scope.submitNow = function(){
      $scope.submitted = true;
    };

    $scope.submit = function(name, email, isValid){
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