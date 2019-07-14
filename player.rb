class Player

  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def question
    @num1 = rand(1...20)
    @num2 = rand(1...20)
    answer = @num1 + @num2

    puts "What is #{@num1} + #{@num2}?"
    guess = gets.chomp

    if (guess.to_i == answer)
      puts "Correct!"
      puts
    else
      puts "Wrong answer!"
      puts
      @lives = @lives - 1 
    end

  end

  def dead?
    return lives <= 0
  end

end
