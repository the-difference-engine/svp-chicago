(function() {
  "use strict";

  angular.module('app')

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

 .service('fileUpload', ['$http', function ($http) {
    this.uploadFileToUrl = function(file, uploadUrl, type) {
       var fd = new FormData();
       fd.append('file', file);

       $http.post(uploadUrl+'?doc_type='+type+'&current_user='+gon.user_id, fd, {
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

  .controller("rfpsCtrl", ["$scope", "$http", "$compile", "fileUpload", function($scope, $http, $compile, fileUpload){
    window.scope = $scope;

    $scope.setup = function(){

      $scope.confirmation = false;

      $http.get('/api/v1/rfp_sections.json').then(function(response){
        $scope.sections = response.data;

        //FOR CURRENT PROGRAMS SECTION:
        //Assign this question to recieve mutiple answers

        for(var i=0; i<$scope.sections.length;i++){

          for(var j=0; j<$scope.sections[i].questions.length;j++){

            if($scope.sections[i].questions[j].question_type==="multiple input"){

              $scope.sections[i].questions[j] = {
                id: $scope.sections[i].questions[j].id,
                question: $scope.sections[i].questions[j].question,
                question_type: "multiple input",
                answers: [{}]
              };

            } else if ($scope.sections[i].questions[j].question_type==="block with multiple inputs"){

              for(var k=0; k<$scope.sections[i].questions[j].sub_questions.length; k++){

                $scope.sections[i].questions[j].sub_questions[k] = {
                  id: $scope.sections[i].questions[j].sub_questions[k].id,
                  question: $scope.sections[i].questions[j].sub_questions[k].question,
                  question_type: "block with multiple inputs",
                  answers: [{}]
                };
              };
            };
          };
        };
        console.log($scope.sections);
      });
    };

    $scope.submitForm = function(submitStatus){   

      if (submitStatus == true && $scope.confirmation == false) {
        alert("You need to upload files in order to submit");
        return;
      } 
      var newRfp = {
        rfp_sections: $scope.sections,
        submitted: submitStatus
      };
      console.log(newRfp);
      console.log($scope.sections[3]);
      $http.post('/api/v1/rfp_sections.json', newRfp).success(function(response){
          if (submitStatus == true) {
            alert("Your request for proposal has been submitted!");
          } else {
            alert("Your request for proposal form has been saved.");
          }
          window.location.href = '/';
        }).error(function(response){
          $scope.errors = response;
          alert($scope.errors);
        });
    };

    $scope.addInput = function(id){
      console.log(id);
      for(var i=0; i<$scope.sections.length;i++){
        for(var j=0; j<$scope.sections[i].questions.length;j++){
          if($scope.sections[i].questions[j].id==id){
            if($scope.sections[i].questions[j].question_type==="multiple input"){
              $scope.sections[i].questions[j].answers.push({});
            } else if ($scope.sections[i].questions[j].question_type==="block with multiple inputs"){
              for(var k=0; k<$scope.sections[i].questions[j].sub_questions.length; k++){
                $scope.sections[i].questions[j].sub_questions[k].answers.push({});
              }
            }
          };
        };
      };
    };

    $scope.removeInput = function(id){
      console.log(id);
      for(var i=0; i<$scope.sections.length;i++){
        for(var j=0; j<$scope.sections[i].questions.length;j++){
          if($scope.sections[i].questions[j].id==id){
            if($scope.sections[i].questions[j].question_type==="multiple input"){
              $scope.sections[i].questions[j].answers.splice(-1);
            } else if ($scope.sections[i].questions[j].question_type==="block with multiple inputs"){
              for(var k=0; k<$scope.sections[i].questions[j].sub_questions.length; k++){
                $scope.sections[i].questions[j].sub_questions[k].answers.splice(-1);
              }
            }
          };
        };
      };
    };

    $scope.uploadFile = function(){
       var file = $scope.myFile;
       var file2 = $scope.myFile2;
       var file3 = $scope.myFile3;
       var file4 = $scope.myFile4;
       var file5 = $scope.myFile5;
       var file6 = $scope.myFile6;
       var file7 = $scope.myFile7;
       console.log('file is ' );
       console.dir(file);
       console.dir(file2);
       var uploadUrl = "/api/v1/attachments.json";

       if (file && file2 && file3 && file4 && file5) {
        fileUpload.uploadFileToUrl(file, uploadUrl, "IRS Determination Letter");
        fileUpload.uploadFileToUrl(file2, uploadUrl, "Organization Chart" );
        fileUpload.uploadFileToUrl(file3, uploadUrl, "Financial Statement: Recent Fiscal Year-End");
        fileUpload.uploadFileToUrl(file4, uploadUrl, "Financial Statement: Most Recent Month-End");
        fileUpload.uploadFileToUrl(file5, uploadUrl, "Minutes from Board Meetings");
        $scope.confirmation = true;
      } else {
        alert("Some file uploads are required");
        return -1;
      }

      if (file6) {
       fileUpload.uploadFileToUrl(file6, uploadUrl, "Current Strategic Plan");
     }
     if (file7) {
       fileUpload.uploadFileToUrl(file7, uploadUrl, "Most Recent Annual Report");
     }

      alert("Your files were successfully uploaded! If you are satisfied with your information, hit the Submit button to send to SVP. Otherwise click the Save button to return and edit later.");
      
    };


  }]);

}());
