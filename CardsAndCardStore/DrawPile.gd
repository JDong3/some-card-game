extends Node2D
class_name DrawPile

"""
at the start of the fight the DrawPile will need to get every card in the deck
and suffle put them in a random order for the Hand to draw from
"""

var cards
var fight_club
var text

func _init():
	cards = []
	fight_club = Global.FIGHT_CLUB

	text = Label.new()
	add_child(text)
	position = Vector2(50, 200)

func load_from_deck():
	"""
	used at start of fight to load all cards from the deck into the DrawPile
	"""
	cards = fight_club.deck.cards
	text.text = 'draw pile: %s' % cards.size()
	shuffle()

func load_from_discard():
	for i in range(fight_club.discard_pile.cards.size()):
		var card = fight_club.discard_pile.give()
	text.text = 'draw pile: %s' % cards.size()

func add_card(card):
	cards.push_back(card)
	text.text = 'draw pile: %s' % cards.size()

func shuffle():
	"""
	should cards be shuffuled in this location
	"""
	cards.shuffle()

func give():
	"""
	"""
	if cards.size() == 0:
		load_from_discard()

	var res = cards.pop_front()
	text.text = 'draw pile: %s' % cards.size()
	return res