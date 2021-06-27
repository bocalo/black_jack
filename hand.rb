class Hand
  attr_reader :cards, :score, :deposit

  def initialize
    @cards  = []
    @score = 0
    @deposit = 100
  end

  def hit!(deck) # взять карту из колоды
    @cards << deck.deck.shift
  end

  def cards_count
    @cards.count
  end

  def show_cards
    @cards.each_with_index { |card, i| puts "Вам досталась карта #{i + 1}: #{card.value}#{card.suit}" }
  end

  def count_score
    score = 0
    ace = false
    @cards.each do |card|
      score += card.card_value
      ace = true if card.ace?
    end
    score -= 10 if ace == true && score > 21
    @score = score
  end
end


