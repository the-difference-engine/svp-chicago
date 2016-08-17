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
    this.uploadFileToUrl = function(file, uploadUrl) {
       var fd = new FormData();
       fd.append('file', file);

       $http.post(uploadUrl, fd, {
          transformRequest: angular.identity,
          headers: {'Content-Type': undefined}
       })

       .success(function(){
          alert("Your file has been successfully uploaded!");
       })

       .error(function(){
          alert("Something went wrong. Did you select a file?");
       });
    }
  }])

  .controller("rfpsCtrl", ["$scope", "$http", "$compile", "fileUpload", function($scope, $http, $compile, fileUpload){
    window.scope = $scope;

    $scope.setup = function(){

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

    $scope.submitForm = function(){
      var newRfp = {
        rfp_sections: $scope.sections
      };
      console.log(newRfp);
      console.log($scope.sections[3]);
      $http.post('/api/v1/rfp_sections.json', newRfp).success(function(response){
          console.log(response);
          window.location.href = '/rfps';
        }).error(function(response){
          $scope.errors = response;
          console.log($scope.errors);
        })
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

    $scope.uploadFile = function(){
       var file = $scope.myFile;

       console.log('file is ' );
       console.dir(file);

       var uploadUrl = "/api/v1/attachments.json";
       fileUpload.uploadFileToUrl(file, uploadUrl);
    };

  }]);

}());
