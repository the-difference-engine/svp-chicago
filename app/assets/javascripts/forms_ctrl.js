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
        console.log($scope.contact_section);
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

    $scope.submit = function(newAnswer){

    debugger;
    };



  });

  
}());