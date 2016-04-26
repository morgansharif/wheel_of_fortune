class WheelOfFortune
  attr_reader :theme, :guesses
  attr_accessor :phrase
  def initialize(h)
    @phrase = h[:phrase]
    @theme = h[:theme]
    @guesses = []
  end

  def to_s
    ltrs= @guesses.join.upcase
    regex = "^[" + @guesses.join + ltrs  + "\s]"
    p @phrase
    p @phrase.tr(regex, "_")
  end

  def can_i_have?(guess)
    @guesses.push(guess.downcase)
    @phrase.downcase.include? guess.downcase
  end

  def game_over?
    to_s == @phrase
  end
end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  p j
  puts j # calls j.to_s

end
