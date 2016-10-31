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

          if($scope.sections[i].rfp_questions[j].question_id==id){

            if($scope.sections[i].rfp_questions[j].question_type==="multiple input"){
              $scope.sections[i].rfp_questions[j].rfp_answers.push({});
            } else if ($scope.sections[i].rfp_questions[j].question_type==="block with multiple inputs"){
                
                for(var k=0; k<$scope.sections[i].rfp_questions[j].sub_questions.length; k++){
                  console.log("I am here");
                $scope.sections[i].rfp_questions[j].sub_questions[k].sub_answers.push({});
              }
            }
            
          };
        };
      };
    };

    //SETS TO TRUE IF APPLICANT IS FINISHED WITH RFP FORM
    $scope.submitNow = function(){
      $scope.submitted = true;
    };

    $scope.submitForm = function(submitStatus){
      var newRfp = {
        rfp_sections: $scope.sections,
        submitted: submitStatus
      };
      console.log(newRfp);
      console.log($scope.sections);
      // $http.patch('/api/v1/rfp_sections/'+ $scope.activeId + '.json', newRfp).success(function(response){
      //     if (submitStatus == true) {
      //       alert("Your request for proposal has been submitted!");
      //     } else {
      //       alert("Your request for proposal form has been saved.");
      //     }
      //     window.location.href = '/';
      //   }).error(function(response){
      //     $scope.errors = response;
      //     alert($scope.errors);
      //   })

    };

  }]);

}());