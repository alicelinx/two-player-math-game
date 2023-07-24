class Question
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def text
    "What does #{@num1} plus #{@num2} equal?"
  end

  def answer_correct?(player_answer)
    player_answer.to_i == @num1 + @num2    
  end
end

question = Question.new
puts question.text
puts question.answer_correct?(20)