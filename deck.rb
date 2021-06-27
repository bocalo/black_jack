require_relative 'card'
require_relative 'deck'

class Deck
  SUITS = ['♣', '♦', '♥', '♠']
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_reader :deck

  def initialize
    @deck = create_deck
  end

  def deal_cards # раздавать карты
    @deck.pop
  end

  def create_deck
    all_cards = []

    VALUES.each do |value|
      SUITS.each do |suit|
        all_cards << Card.new(suit, value)
      end
    end
    all_cards.shuffle
  end
end

