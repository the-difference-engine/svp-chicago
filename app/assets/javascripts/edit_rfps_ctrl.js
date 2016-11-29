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
      });
    };

    $scope.addInput = function(id){
      //Loop through rfp sections
      for(var i=0; i<$scope.sections.length;i++){
        //Loop through the questions in each section
        for(var j=0; j<$scope.sections[i].rfp_questions.length;j++){

          //Check the question id
          if($scope.sections[i].rfp_questions[j].question_id==id){

            //Push on rfp_answers array if multiple input
            //Push on sub_answers array if block with multiple inputs
            if($scope.sections[i].rfp_questions[j].question_type==="multiple input"){
              $scope.sections[i].rfp_questions[j].rfp_answers.push({});
            } else if ($scope.sections[i].rfp_questions[j].question_type==="block with multiple inputs"){
                
              //Loop through sub_questions
              for(var k=0; k<$scope.sections[i].rfp_questions[j].sub_questions.length; k++){
                $scope.sections[i].rfp_questions[j].sub_questions[k].sub_answers.push({});
              }
            }
            
          };
        };
      };
    };

    function removeMultipleInputFromDatabase(questionId){
      $http.delete('/api/v1/rfp_answers?rfp_id=' + $scope.activeId + "&rfp_question_id=" + questionId).then(function(response){
      });
    }

    function removeSubQuestionFromDatabase(subQuestionId){

      $http.delete('/api/v1/sub_answers?rfp_id=' + $scope.activeId + "&sub_question_id=" + subQuestionId).then(function(response){
      });
    }

    $scope.removeInput = function(id){
      //Loop through rfp sections
      for(var i=0; i<$scope.sections.length;i++){
        //Loop through the questions in each section
        for(var j=0; j<$scope.sections[i].rfp_questions.length;j++){

          //Check the question id
          if($scope.sections[i].rfp_questions[j].question_id==id){

            if($scope.sections[i].rfp_questions[j].question_type==="multiple input"){

              //removes the last input from rfp_answers array
              var rfpAnswerHolder = $scope.sections[i].rfp_questions[j].rfp_answers.splice(-1)
              
              //if the answer exists in the database removeFromDatabase()
              if(rfpAnswerHolder[0].rfp_answer_id){
                removeMultipleInputFromDatabase($scope.sections[i].rfp_questions[j].question_id);
              }
            } else if ($scope.sections[i].rfp_questions[j].question_type==="block with multiple inputs"){
                
              //Loop through sub_questions
              for(var k=0; k<$scope.sections[i].rfp_questions[j].sub_questions.length; k++){

                var subAnswerHolder = $scope.sections[i].rfp_questions[j].sub_questions[k].sub_answers.splice(-1);
                //If sub answer exists in the database, remove it
                if(subAnswerHolder[0].sub_answer_id){
                  removeSubQuestionFromDatabase($scope.sections[i].rfp_questions[j].sub_questions[k].sub_question_id);
                }
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

      
      $http.patch('/api/v1/rfp_sections/'+ $scope.activeId + '.json', newRfp).success(function(response){
          if (submitStatus == true) {
            alert("Your request for proposal has been submitted!");
          } else {
            alert("Your request for proposal form has been saved.");
          }
          window.location.href = '/';
        }).error(function(response){
          $scope.errors = response;
          alert($scope.errors);
        })

    };

  }]);

}());