# frozen_string_literal: true

class Interface
  def welcome_message
    print line
    puts 'Вас приветствует Game Black Jack!'
    print line
  end

  def input_name
    print 'Введите ваше имя: '
    gets.chomp.to_s.capitalize
  end

  def start_round
    puts ''
    puts '----- Начало раунда -----'
  end

  def hidden_cards(size)
    puts "Карты дилера: #{'*' * size}."
  end

  def show_score(name, score)
    puts "#{name} набрал очков: #{score}"
  end

  def show_cards(_name, _cards)
    puts 'Неплохо!'
  end

  def actions_menu(name, add_card = false)
    puts ''
    puts "----- #{name}, ваш ход: -----"
    puts 'Введите число: '
    puts '1. Добавить карту'
    puts 'Любой символ - Не добавлять' if add_card
    puts '2. Пропустить ход' unless add_card
    puts '3. Открыть карты' unless add_card
    gets.chomp.to_i
  end

  def next_menu(name)
    puts ''
    puts "----- #{name}, можете сыграть еще раунд -----"
    puts 'Введите число: '
    puts '1. Нажмите 1, если хотите продолжить.'
    puts '2. Нажмите любой символ, если не хотите. Выход из игры.'
    gets.chomp.to_i
  end

  def wrong_input
    puts 'Неверно! Попробуйте еще раз!'
  end

  def add_card(_name)
    puts ''
    puts '----- Дилер взял еще одну карту. -----'
    puts ''
  end

  def dealer_not_take_card(_name)
    puts ''
    puts '----- Дилер не стал брать карту -----'
    puts ''
  end

  def open_cards
    puts ''
    puts '----- Открываем карты -----'
  end

  def set_winner(name, bank)
    puts ''
    print line
    puts "#{name} победил в этом раунде, счет составляет #{bank} монет."
    print line
  end

  def show_tie
    print line
    puts '----- Ничья -----'
    print line
  end

  def two_busted
    print line
    puts '----- Игрок и дилер проиграли -----'
    print line
  end

  def show_busted(name)
    print line
    puts "----- '#{name}' ПРОИГРАЛ, закончились деньги. Выход из игры -----"
    print line
  end

  def line
    puts '------------------------------------------'
  end
end
