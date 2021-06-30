# frozen_string_literal: true

require_relative 'hand'
require_relative 'bank'

class Player
  BET = 10
  WIN_BET = BET * 2

  attr_reader :name, :bank
  attr_accessor :hand

  def initialize(name)
    @name = name
    @hand = Hand.new
    @bank = Bank.new(100)
  end

  def get_card(deck)
    @hand.hit!(deck)
  end

  def cards_count
    @hand.cards_count
  end

  def make_bet
    @bank.minus(BET)
  end

  def take_bet_money
    @bank.plus(BET)
  end

  def take_win_bet
    @bank.plus(WIN_BET)
  end

  def clear_info
    @hand.clear_hand
  end

  def score
    @hand.count_score
  end

  def over_max?
    @hand.over_max?
  end

  def open_cards
    @hand.show_cards
  end
end
