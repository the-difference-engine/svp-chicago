(function() {
  "use strict";

  angular.module("app").controller("rfpsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
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
                console.log($scope.sections[i].questions[j].sub_questions[k])

              };
      
            };

          };

        };

      });

    };

    $scope.submit = function(isValid){
  
      if (isValid) {

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
            console.log(response);
          })
      } else {
        alert("Form is invalid");
      };

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

    $scope.uploadAttachment = function() {
      $http.post('/api/v1/attachments.json').success(function(response){
        alert('Your file has been uploaded');
      })
    };

  }]);
}());
