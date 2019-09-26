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
	update()
	shuffle()

func load_from_discard():
	"""
	used at start of battle, copies the cards from deck into DrawPile and
	shuffles the DrawPile
	"""
	var pile_size = fight_club.discard_pile.cards.size()
	for i in range(pile_size):
		var card = fight_club.discard_pile.give()
		add_card(card)
	update()

func add_card(card):
	"""
	adds a card to the hand
	"""
	cards.push_back(card)
	update()

func shuffle():
	"""
	should cards be shuffuled in this location
	"""
	cards.shuffle()

func is_empty():
	"""
	tells you whether the DrawPile is empty
	:return: bool
	"""
	return cards.size() == 0

func give():
	"""
	removes a card from the draw pile and sends it in as the return value
	:return: Card or null, null if DrawPile and DiscardPile are both empty
	"""
	# if there are no cards to give, load more cards from the draw pile
	if is_empty():
		load_from_discard()

	# if there are no cards to give, and the discard pile is empty just return
	if is_empty() and fight_club.discard_pile.is_empty():
		return

	# return the top card of the pile
	var res = cards.pop_front()
	update()
	return res

func update():
	"""
	updates the text, should be called when cards is changed
	"""
	text.text = 'draw pile: %s' % cards.size()