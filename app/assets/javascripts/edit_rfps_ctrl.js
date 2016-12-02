(function() {
  "use strict";

  angular.module("app")

  .directive('fileModel', ['$parse', function ($parse) {
    return {
       restrict: 'A',
       link: function(scope, element, attrs) {
          var model = $parse(attrs.fileModel);
          var modelSetter = model.assign;

          element.bind('change', function(){
             scope.$apply(function(){
                modelSetter(scope, element[0].files[0]);
             });
          });
       }
    };
  }])

  .service('fileUploadEdit', ['$http', function ($http) {
     this.uploadFileToUrlEdit = function(file, uploadUrl, type, rfpId) {
        var fd = new FormData();
        fd.append('file', file);

        $http.post(uploadUrl+'?doc_type='+type+'&current_user='+gon.user_id+'&rfp_id='+rfpId, fd, {
           transformRequest: angular.identity,
           headers: {'Content-Type': undefined}
        })

        .success(function(){

           // alert("Your file has been successfully uploaded!");
        })

        .error(function(){
           alert("Something went wrong. Did you select a file?");
        });
     }
   }])

  .controller("editRfpsCtrl", ["$scope", "$http", "$compile", "fileUploadEdit", function($scope, $http, $compile, fileUploadEdit){
    window.scope = $scope;

    $scope.setup = function(){
      $scope.activeId = gon.id;

      $scope.user_id = gon.user_id;

      $scope.submitted = false;

      $scope.required = gon.req

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

    $scope.uploadFile = function(){
      if (!$scope.required) {
       var file = $scope.myFile;
       var file2 = $scope.myFile2;
       var file3 = $scope.myFile3;
       var file4 = $scope.myFile4;
       var file5 = $scope.myFile5;
       var file6 = $scope.myFile6;
       var file7 = $scope.myFile7;
      } else {
        var file6 = $scope.myFile6;
        var file7 = $scope.myFile7;
      }
 
       var uploadUrl = "/api/v1/attachments.json";

       if (file && file2 && file3 && file4 && file5) {
        fileUploadEdit.uploadFileToUrlEdit(file, uploadUrl, "IRS Determination Letter", $scope.activeId);
        fileUploadEdit.uploadFileToUrlEdit(file2, uploadUrl, "Organization Chart", $scope.activeId );
        fileUploadEdit.uploadFileToUrlEdit(file3, uploadUrl, "Financial Statement: Recent Fiscal Year-End", $scope.activeId);
        fileUploadEdit.uploadFileToUrlEdit(file4, uploadUrl, "Financial Statement: Most Recent Month-End", $scope.activeId);
        fileUploadEdit.uploadFileToUrlEdit(file5, uploadUrl, "Minutes from Board Meetings", $scope.activeId);
        $scope.confirmation = true;
      } else if ($scope.required){
        $scope.confirmation = true;
      } else {
        alert("Some file uploads are required");
        return -1;
      }

      if (file6) {
       fileUploadEdit.uploadFileToUrlEdit(file6, uploadUrl, "Current Strategic Plan", $scope.activeId);
     }
     if (file7) {
       fileUploadEdit.uploadFileToUrlEdit(file7, uploadUrl, "Most Recent Annual Report", $scope.activeId);
     }

      alert("Your files were successfully uploaded! If you are satisfied with your information, hit the Submit button to send to SVP. Otherwise click the Save button to return and edit later.");
      
    };


  }]);

}());