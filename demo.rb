require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'
require_relative 'dealer'



card = Card.new("♣", "J")
card = Card.new("♣", "Q")
# pp card
# pp card.card_value
# pp card.to_s
#pp card.ace?

deck = Deck.new
#pp deck
# deck.deal_cards
# deck.deal_cards
# deck.deal_cards


hand = Hand.new
hand
hand.hit!(deck)
hand.hit!(deck)
# pp hand.hit!(deck)
# # pp hand.hit!(deck)
hand.cards_count

#hand.show_cards
#pp hand.count_score

player = Player.new('Adam')
player.get_card(deck)
#pp player.add_card
#pp player.get_card(deck)
# # pp player.get_card(deck)
# # #player.reset_hand
#pp player.make_bet
# # pp player.give_money
# # pp player.take_money
player.cards_count
#pp player.score
# pp player.open_cards

dealer = Dealer.new
pp dealer
