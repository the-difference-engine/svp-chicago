require 'rails_helper'

RSpec.describe Question, type: :model do
  it "is valid with a question, and section id" do
    question = Question.new(
      question: "question",
      section_id: "5"
      )
    expect(question).to be_valid
  end
end
