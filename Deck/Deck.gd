extends Node
class_name Deck

"""
A deck is filled with card objects
"""

var cards
var props = {}

func init(_props):
	"""
	_props:
		cards: Array<Cards>=[]
	"""
	if !props.has('cards'):
		cards = []
	else:
		cards = props.cards

func add_card(card_):
	cards.push_back(card_)

func remove_card(card_):
	cards.erase(card_)

