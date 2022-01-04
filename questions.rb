class Question 
  attr_reader :num1, :num2, :answer 

  def initialize 
    @num1 = rand(0...20)
    @num2 = rand(0...20)
    @answer = @num1 + @num2
  end 

  def evaluate?(answer)
    @answer == answer
  end 

end 