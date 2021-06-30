# frozen_string_literal: true

require_relative 'player'

class Dealer < Player
  def initialize
    super('Dealer')
  end

  def add_card?
    return true if @hand.score < 17 && @hand.cards.size < 3
  end
end
