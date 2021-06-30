# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :deck

  def initialize
    @deck = create_deck
  end

  # def deal_cards
  #   @deck.pop
  # end

  def create_deck
    all_cards = []

    Card::VALUES.each do |value|
      Card::SUITS.each do |suit|
        all_cards << Card.new(suit, value)
      end
    end
    all_cards.shuffle
  end
end
