(function() {
  "use strict";

  angular.module("app").controller("formsCtrl", ["$scope", "$http", "$compile", function($scope, $http, $compile){
    window.scope = $scope;

    $scope.setup = function(){

      $http.get('/api/v1/lois.json').then(function(response){
        $scope.lois = response;
      });

  		$scope.setupRatings = function(){
  			$http.get('/api/v1/ratings.json').then(function(response){
  				$scope.ratings = response.data;
  				console.log($scope.ratings);
  			});
  		};
  		$scope.ratingFilter = function(){
  			console.log("clicked!");
  		};

      $scope.submitted = false;
      $scope.invalidSubmission = false;
      $scope.activeSection = 0;
      $scope.activeSectionArray = [true, true, true, true, true, true, true, true];
      
      // USE BELOW FOR MULTI-PAGE WIZARD
      // $scope.activeSectionArray = [true, false, false, false, false, false, false, false];

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

        $scope.activeChallenge = {}; //THIS VARIABLE IS FOR addChallenge()
        //INITIALIZE THE FTE TOTALS
        $scope.fte_1 = 0;
        $scope.fte_2 = 0;
        $scope.fte_3 = 0;

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

            $scope.activeChallenge[$scope.challenge_section.questions[i].id] = 0; //THIS VARIABLE IS FOR addChallenge()

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

    $scope.submitNow = function(){
      $scope.submitted = true;
    };

    $scope.submit = function(name, email, isValid){

      if ((isValid && $scope.submitted)  || !$scope.submitted) {
        if ($scope.submitted) {
          var areYouSure = confirm("Do you want to Submit? Once the LOI has been submitted it is no longer allowed to be edited. If you need to edit the LOI later, please use the 'Save and Submit Later' button.");
          if (!areYouSure){
            $scope.submitted = false;
            return;
          }
        }
      
        var newLoi = {
          name: name,
          email: email,
          submitted: $scope.submitted,
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
        console.log("posting......");
        $http.post('/api/v1/lois.json', newLoi).success(function(response){
            window.location = '/thanks/' + response.loi_id;
            console.log("SUCCESS");
          }).error(function(response){
            // $scope.errors = response.errors;
            console.log("ERROR");
          });
      } else {
        $scope.invalidSubmission = true;
        alert("Form is invalid. See area marked in red.");
      };
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

    //NEXT AND PREVIOUS SECTION BUTTONS FOR MULTI-STEP FORM

    $scope.nextSection = function(){

      $scope.activeSectionArray[$scope.activeSection] = false;
      
      if ($scope.activeSection == $scope.activeSectionArray.length-1) {
        $scope.activeSection = 0;
      } else {
        $scope.activeSection++;
      };

      $scope.activeSectionArray[$scope.activeSection] = true;

    };

    $scope.prevSection = function(){

      $scope.activeSectionArray[$scope.activeSection] = false;
      
      if ($scope.activeSection == 0) {
        $scope.activeSection = $scope.activeSectionArray.length-1;
      } else {
        $scope.activeSection--;
      };

      $scope.activeSectionArray[$scope.activeSection] = true;

    };

    //ADD CHALLENGE BUTTON FOR ORGANIZATIONAL CAPICTY CHALLENGES (LIMIT 3)
    $scope.addChallenge = function(questionId){

      if ($scope.activeChallenge[questionId] < 2){
        $scope.activeChallenge[questionId]++;
      } 
    };

    $scope.addFte = function(){
      $scope.fte_1 = 0;
      $scope.fte_2 = 0;
      $scope.fte_3 = 0;
      for(var i = 0; i < $scope.challenge_formData.length; i++){
            if ($scope.challenge_formData[i].fte_1 === parseFloat($scope.challenge_formData[i].fte_1)) {
              $scope.fte_1 += parseFloat($scope.challenge_formData[i].fte_1);
            }
            if ($scope.challenge_formData[i].fte_2 === parseFloat($scope.challenge_formData[i].fte_2)) {
              $scope.fte_2 += parseFloat($scope.challenge_formData[i].fte_2);
            }
            if ($scope.challenge_formData[i].fte_3 === parseFloat($scope.challenge_formData[i].fte_3)) {
              $scope.fte_3 += parseFloat($scope.challenge_formData[i].fte_3);
            }
          };
    };

  }]);
}());