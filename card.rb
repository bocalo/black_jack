class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def card_value
    return 10 if ['J','Q','K'].include?(@value)
    return 11 if ['A'].include?(@value)
    return @value 
  end

  def ace?
    return true if ['A'].include?(@value)
    false
  end
end







