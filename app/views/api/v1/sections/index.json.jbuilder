json.sections do 

    json.contact_section do
    	json.id @contact_section.id
      json.name @contact_section.name

      json.questions @contact_section.questions.each do |question|
        json.id question.id
        json.question question.question
      end
    end

    json.overview_section do
      json.id @overview_section.id
      json.name @overview_section.name

      json.questions @overview_section.questions.each do |question|
        json.id question.id
        json.question question.question
      end
    end

    json.vision_section do
      json.id @vision_section.id
      json.name @vision_section.name

      json.questions @vision_section.questions.each do |question|
        json.id question.id
        json.question question.question
      end
    end

    json.concern_section do
      json.id @concern_section.id
      json.name @concern_section.name

      json.questions @concern_section.questions.each do |question|
        json.id question.id
        json.question question.question
      end
    end

    json.challenge_section do
      json.id @challenge_section.id
      json.name @challenge_section.name

      json.questions @challenge_section.questions.each do |question|
        json.id question.id
        json.question question.question
      end
    end

    json.referral_section do
      json.id @referral_section.id
      json.name @referral_section.name

      json.questions @referral_section.questions.each do |question|
        json.id question.id
        json.question question.question
      end
    end

    json.demographic_section do
      json.id @demographic_section.id
      json.name @demographic_section.name

      json.questions @demographic_section.questions.each do |question|
        json.id question.id
        json.question question.question
      end
    end

    json.geographic_section do
      json.id @geographic_section.id
      json.name @geographic_section.name

      json.questions @geographic_section.questions.each do |question|
        json.id question.id
        json.question question.question
      end
    end

end