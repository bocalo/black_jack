require_relative 'hand'

class Player
  attr_reader :name
  attr_accessor :deposit, :hand, :score

  def initialize(name)
    @name = name
    @hand = Hand.new
    @deposit = 100
    @score = 0
  end

  def get_card(deck)
    @hand.hit!(deck)
  end

  def cards_count
    @hand.cards_count
  end

  def give_money(value = 0)
    raise StandardError unless value <= @deposit
    @deposit -= value
    value
  end

  def take_money(value = 0)
    @deposit += value
  end

  def make_bet
    if @deposit > 10
      @deposit -= 10
    else
      puts 'Not enough money!'
      exit
    end
  end

  def clear_info
    @hand = Hand.new
  end

  def score
    @hand.count_score
  end

  def open_cards
    @hand.show_cards
  end
end





  



  