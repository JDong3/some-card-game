extends Node

var cards

func _init(cards_=[]):
	cards = cards_

func add_card(card_):
	cards.append(card_)

func remove_card(card_):
	cards.erase(card_)

