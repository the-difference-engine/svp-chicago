json.array! @rfp_sections do |section|
  json.id section.id
  json.name section.name
  json.questions section.rfp_questions do |question|
    if question.is_active != false
      json.id question.id
      json.question question.question
      json.question_type question.question_type
      json.sub_questions question.sub_questions
      json.is_active question.is_active
      if @loi && Question.find_by(question: question.question)
        json.answer @loi.answers.find_by(question_id: Question.find_by(question: question.question).id).answer
      end
    end
  end
end