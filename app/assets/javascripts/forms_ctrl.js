(function() {
  "use strict";

  angular.module("app").controller("formsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
  	window.scope = $scope;

		$scope.setup = function(){

			$http.get('/api/v1/lois.json').then(function(response){
				$scope.lois = response;
			});

      $http.get('/api/v1/sections.json').then(function(response){

        //CONTACT SECTION
        $scope.contact_section = response.data.sections.contact_section; 

        $scope.contact_formData = [];
        for (var i=0; i<$scope.contact_section.questions.length; i++){
            var dataHolder = {
              answer: "",
              question: $scope.contact_section.questions[i].question,
              question_id: $scope.contact_section.questions[i].id
            };
            $scope.contact_formData[i] = dataHolder;
          }

        //ORGANIZATION SECTION
        $scope.organization_section = response.data.sections.organization_section;

        $scope.organization_formData = [];
        for (var i=0; i<$scope.organization_section.questions.length; i++){
            var dataHolder = {
              answer: "",
              question: $scope.organization_section.questions[i].question,
              question_id: $scope.organization_section.questions[i].id
            };
            $scope.organization_formData[i] = dataHolder;
          }

        //OVERVIEW SECTION
        $scope.overview_section = response.data.sections.overview_section;

        $scope.overview_formData = [];
        for (var i=0; i<$scope.overview_section.questions.length; i++){
            var dataHolder = {
              answer: "",
              question: $scope.overview_section.questions[i].question,
              question_id: $scope.overview_section.questions[i].id
            };
            $scope.overview_formData[i] = dataHolder;
          }

        //VISION SECTION
        $scope.vision_section = response.data.sections.vision_section;

        $scope.vision_formData = [];
        for (var i=0; i<$scope.vision_section.questions.length; i++){
            var dataHolder = {
              answer: "",
              question: $scope.vision_section.questions[i].question,
              question_id: $scope.vision_section.questions[i].id
            };
            $scope.vision_formData[i] = dataHolder;
          }

        //KEY CONCERNS SECTION
        $scope.concern_section = response.data.sections.concern_section;

        $scope.concern_formData = [];
        for (var i=0; i<$scope.concern_section.questions.length; i++){
            var dataHolder = {
              answer: "",
              question: $scope.concern_section.questions[i].question,
              question_id: $scope.concern_section.questions[i].id
            };
            $scope.concern_formData[i] = dataHolder;
          }

        //CHALLENGE SECTION
        $scope.challenge_section = response.data.sections.challenge_section;

        $scope.challenge_formData = [];
        for (var i=0; i<$scope.challenge_section.questions.length; i++){

            var challenges = { 
              challenge: "",
              priority: ""
            }

            var dataHolder = {
              fte_1: "",
              fte_2: "",
              fte_3: "",
              challenges: [{priority: "", challenge: ""}],
              answer: "",
              question: $scope.challenge_section.questions[i].question,
              question_id: $scope.challenge_section.questions[i].id
            };
            $scope.challenge_formData[i] = dataHolder;
          }

        //REFERRAL SECTION
        $scope.referral_section = response.data.sections.referral_section;

        $scope.referral_formData = [];
        for (var i=0; i<$scope.referral_section.questions.length; i++){
            var dataHolder = {
              answer: "",
              question: $scope.referral_section.questions[i].question,
              question_id: $scope.referral_section.questions[i].id
            };
            $scope.referral_formData[i] = dataHolder;
          }

        //DEMOGRAPHIC SECTION
        $scope.demographic_section = response.data.sections.demographic_section;

        $scope.demographic_formData = [];
        for (var i=0; i<$scope.demographic_section.questions.length; i++){
            var dataHolder = {
              answer: "",
              question: $scope.demographic_section.questions[i].question,
              question_id: $scope.demographic_section.questions[i].id
            };
            $scope.demographic_formData[i] = dataHolder;
          }

        //GEOGRAPHIC SECTION
        $scope.geographic_section = response.data.sections.geographic_section;

        $scope.geographic_formData = [];
        for (var i=0; i<$scope.geographic_section.questions.length; i++){
            var dataHolder = {
              answer: "",
              question: $scope.geographic_section.questions[i].question,
              question_id: $scope.geographic_section.questions[i].id
            };
            $scope.geographic_formData[i] = dataHolder;
          }


      });
		};


    $scope.submit = function(name, email){

      console.log($scope.challenge_formData);
      // $scope.addAnswer($scope.overview_formData);

      var newLoi = {
        name: name,
        email: email,
        contact_answers: $scope.contact_formData,
        organization_answers: $scope.organization_formData,
        overview_answers: $scope.overview_formData,
        vision_answers: $scope.vision_formData,
        concern_answers: $scope.concern_formData,
        challenge_answers: $scope.challenge_formData,
        referral_answers: $scope.referral_formData,
        demographic_answers: $scope.demographic_formData,
        geographic_answers: $scope.geographic_formData
      };

        console

      $http.post('/api/v1/lois.json', newLoi).then(function(response){
          console.log(response.data.loi_id);
          window.location = '/thanks/' + response.data.loi_id;
        });

    };

    $scope.addAnswer = function(newAnswers){

      for (var i=0; i<newAnswers.length; i++){

        var newAnswer = {
          answer: newAnswers[i]["answer"],
          question_id: newAnswers[i]["question_id"],
        };

        $http.post('/api/v1/answers.json', newAnswer).then(function(response){
          console.log(response);
        });

      };
    };
  }]);

  
}());