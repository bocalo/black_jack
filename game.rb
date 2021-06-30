# frozen_string_literal: true

require_relative 'interface'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

class Game
  def initialize
    @interface = Interface.new
    @interface.welcome_message

    begin
      @player = Player.new(@interface.input_name)
    rescue StandartError => e
      puts e
      retry
    end
    @dealer = Dealer.new
  end

  def main_menu
    loop do
      start_game

      2.times { take_card(@player) }
      2.times { take_card(@dealer) }
      show_cards(@player)
      show_cards(@dealer)
      @player.score
      @dealer.score
      show_score(@player)

      game_menu
    end
  end

  def start_game
    @deck = Deck.new
    @next_round = false
    @interface.start_round
    @player.make_bet
    @dealer.make_bet
  end

  def take_card(name)
    name.hand.hit!(@deck)
  end

  def show_cards(person, open = false)
    return @interface.hidden_cards(@dealer.hand.cards.size) if person.name == 'Dealer' && open == false

    @interface.show_cards(person.name, person.open_cards)
  end

  def show_score(person)
    @interface.show_score(person.name, person.score)
  end

  def game_menu
    loop do
      break if @next_round

      choise = @interface.actions_menu(@player.name)

      case choise
      when 1
        user_add_card
        dealer_turn
        open_cards
      when 2
        dealer_turn
        user_add_card if user_add_card?
        open_cards
      when 3
        open_cards
      else
        @interface.wrong_input
      end
    end
  end

  def dealer_turn
    if @dealer.add_card?
      take_card(@dealer)
      @dealer.score
      @interface.add_card(@dealer)
    else
      @interface.dealer_not_take_card(@dealer)
    end

    show_cards(@dealer)
  end

  def user_add_card
    take_card(@player)
    @player.score
    @interface.add_card(@player.name)
    show_cards(@player)
  end

  def user_add_card?
    choise = @interface.actions_menu(@player.name, true)
    return true if choise == 1
  end

  def open_cards
    @interface.open_cards
    show_cards(@dealer, true)
    show_score(@dealer)
    show_cards(@player)
    show_score(@player)
    find_winner
    next_round
  end

  def find_winner
    winner = select_winner

    case winner
    when :no_winner
      @interface.two_busted
    when :tie
      @player.take_bet_money
      @dealer.take_bet_money
      @interface.show_tie
    when :player
      @player.take_win_bet
      @interface.set_winner(@player.name, @player.bank.balance)
    when :dealer
      @dealer.take_win_bet
      @interface.set_winner(@dealer.name, @dealer.bank.balance)
    end
  end

  def select_winner
    return :no_winner if !@player.over_max? && !@dealer.over_max?
    return :tie if @player.score == @dealer.score
    return :player if @player.score > @dealer.score && @player.over_max?
    return :dealer if @dealer.score > @player.score && @dealer.over_max?
    return :dealer unless @player.over_max?
    return :player unless @dealer.over_max?
  end

  def next_round
    return empty_bank if @player.bank.balance.zero? || @dealer.bank.balance.zero?

    choice = @interface.next_menu(@player.name)

    case choice
    when 1
      @player.clear_info
      @dealer.clear_info
      @next_round = true
    else
      exit
    end
  end

  def empty_bank
    return @interface.show_busted(@player.name) if @player.bank.balance.zero?
    return @interface.show_busted(@dealer.name) if @dealer.bank.balance.zero?

    exit
  end
end

Game.new.main_menu
