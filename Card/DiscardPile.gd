extends Node2D
class_name DiscardPile

var cards
var fight_club
var label

func _init():
	fight_club = Global.FIGHT_CLUB
	label = Label.new()
	add_child(label)
	cards = []
	position = Vector2(350, 200)
	label.text = "discard pile: %s" % cards.size()

func add_card(card):
	cards.push_back(card)
	label.text = "discard pile: %s" % cards.size()

func is_empty():
	"""
	tells you whether the discard pile is empty
	:return: bool
	"""
	return cards.size() == 0

func give():
	var res = cards.pop_front()
	label.text = "discard pile: %s" % cards.size()
	return res