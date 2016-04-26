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

end