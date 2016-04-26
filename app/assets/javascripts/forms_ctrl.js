(function() {
  "use strict";

  angular.module("app").controller("formsCtrl", function($scope, $http){
  	window.scope = $scope;

		$scope.setup = function(){

			$http.get('/api/v1/lois.json').then(function(response){
				$scope.lois = response;
			});

      $http.get('/api/v1/sections.json').then(function(response){

        $scope.contact_section = response.data.sections.contact_section;
    
        var answer = "answer";
        var question = "question";

        $scope.contact_formData = {};
        for (var i=0; i<$scope.contact_section.questions.length; i++){

            var bucket = {};
            bucket[question] = $scope.contact_section.questions[i].question;
            bucket[answer] = "";
            console.log(bucket);
            $scope.contact_formData[i] = bucket;
          }

        $scope.overview_section = response.data.sections.overview_section;

        $scope.overview_formData = {};
        for (var i=0; i<$scope.overview_section.questions.length; i++){

            var bucket = {};
            bucket[question] = $scope.overview_section.questions[i].question;
            bucket[answer] = "";
            console.log(bucket);
            $scope.overview_formData[i] = bucket;
          }


        // console.log($scope.formData);
      });
		};



    $scope.addAnswer = function(newAnswer, newQuestionId){

      var newAnswer = {
        answer: newAnswer,
        question_id: newQuestionId,
      };

      $http.post('/api/v1/answers.json', newAnswer).then(function(response){
        console.log(response);
        $scope.answers.push(newAnswer);
      });
    };

    $scope.submit = function(){
      console.log($scope.overview_formData);
      console.log($scope.contact_formData);

    debugger;
    };



  });

  
}());