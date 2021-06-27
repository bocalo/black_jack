require_relative 'deck'
require_relative 'hand'
require_relative 'dealer'
require_relative 'player'

class Interface
  def start
    puts 'Game Black Jack'
    start_game
    main_menu
  end

  def main_menu
    puts 'Вас приветствует Game Black Jack!'
    
    loop do
      puts '
      --- Меню для игры ---
      Введите номер
      1. Взять карту
      2. Показать карту(ы)
      3. Добавить карту
      4. Посмотреть результат
      5. Завершить игру?
      6. Выйти из программы'

      choice = gets.chomp
      case choice
      when '1' then hit_card
      when '2' then show_cards
      when '3' then add_card
      when '4' then show_result
      when '5' then what_next
      when '6' then exit
      else 
        puts 'Неправильно набран номер. Попробуйте еще раз.'
      end
    end
  end

  def start_game
    puts 'What is your name?'
    name = gets.chomp
    puts 'Имя не должно быть пустым' if name.empty?
    @player = Player.new(name)
    @dealer = Dealer.new
    @deck = Deck.new
    
    @player.make_bet
    @dealer.make_bet
  end

  def hit_card
    puts 'У игока 2 карты'
    puts 'У дилера 2 карты'
    if @player.cards_count > 3 && @dealer.cards_count > 3
        puts 'Перебор. Нельзя иметь больше 3 карт каждому!'
    end
    2.times do
      @deck.create_deck
      @player.get_card(@deck)
      
      @player.give_money(10)
      @deck.create_deck
      @dealer.get_card(@deck)
      @dealer.give_money(10)
    end
  end

  def show_cards
    puts "Player"
    @player.open_cards
    puts "Dealer"
    @dealer.open_cards
    puts "Игрок набрал очков: #{@player.score}"
    puts "Дилер набрал очков: #{@dealer.score}"
    show_money
  end

  def add_card
    puts 'Вы можете добавить карту' if @player.cards_count < 3
    puts 'Карта добавлена.'
    @player.get_card(@deck)
    add_card if @player.cards_count < 3
      if @player.cards_count > 3 && @dealer.cards_count > 3
        puts 'Перебор. Нельзя иметь больше 3 карт каждому!'
      end
    rescue Exception => e
      puts e.message
      retry
    show_cards
  end

  def show_result
    puts "Player"
    puts "#{@player.score}"
    puts "Dealer"
    puts "#{@dealer.score}"
    
    puts "Игрок набрал очков: #{@player.score}"
    puts "Дилер набрал очков: #{@dealer.score}"
    
    if (@player.score < @dealer.score && @dealer.score < 22) || @player.score > 21
      puts "Вы проиграли. Деньги уходят дилеру."
      @dealer.deposit += 20
      @player.deposit -= 20
    elsif (@dealer.score < @player.score && @player.score < 22) || @dealer.score > 21
      puts "Вы выиграли!"
      @player.deposit += 20
    elsif @player.score == @dealer.score
        puts "Ничья"
        @dealer.deposit += 10
        @player.deposit += 10
    else
        puts "Хотели как обычно."
    end
  end

  def show_money
    puts "#{@player.name} сейчас имеет #{@player.deposit}(монет)."
  end

  def clear_info
    @player.clear_info
    @dealer.clear_info
  end

  def what_next
    make_choice
    clear_info
  end

  def make_choice
    puts 'Хотите сыграть еще раз?
    Введите номер 1 или 2
    1. Да
    2. Нет'

    choice = gets.to_i

    case choice
    when '1' then start_game
    when '2' then exit
    else 
      puts 'Неправильно набран номер. Попробуйте еще раз.'
    end
  end
end
Interface.new.start