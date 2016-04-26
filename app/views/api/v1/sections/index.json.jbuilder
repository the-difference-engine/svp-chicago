json.sections do 

    json.contact_section do
    	json.id @contact_section.id
      json.name @contact_section.name

      json.questions @contact_section.questions.each do |question|
        json.id question.id
        json.question question.question
      end
    end

end