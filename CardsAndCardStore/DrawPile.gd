extends Node
class_name DrawPile

"""
at the start of the fight the DrawPile will need to get every card in the deck
and suffle put them in a random order for the Hand to draw from
"""

var cards
var fight_club

func _init():
	cards = []
	fight_club = Global.FIGHT_CLUB

func load_from_deck():
	"""
	used at start of fight to load all cards from the deck into the DrawPile
	"""
	cards = fight_club.deck.cards
	shuffle()


func shuffle():
	"""
	should cards be shuffuled in this location
	"""
	cards.shuffle()

func give():
	"""
	"""
	var res = cards.pop_front()
	return res