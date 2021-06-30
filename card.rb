# frozen_string_literal: true

class Card
  SUITS = ['♣', '♦', '♥', '♠'].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def card_value
    return 10 if %w[J Q K].include?(@value)
    return 11 if ['A'].include?(@value)

    @value
  end

  def ace?
    return true if ['A'].include?(@value)

    false
  end
end
