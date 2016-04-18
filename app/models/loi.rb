class Loi < ActiveRecord::Base
  has_many :answers
  has_many :ratings

  def fte_amount_1_total
    amount = 0
    answers.each do |answer|
      if answer.fte
        amount += answer.fte.amount_1
      end
    end

    return amount
  end

  def fte_amount_2_total
    amount = 0
    answers.each do |answer|
      if answer.fte
        amount += answer.fte.amount_2
      end
    end

    return amount
  end

  def fte_amount_3_total
    amount = 0
    answers.each do |answer|
      if answer.fte
        amount += answer.fte.amount_3
      end
    end

    return amount
  end

end
