extends Node
class_name TransactionInterface

var source # combat entity
var card # transaction dictionary
var target # combat entity
var fight_club = Global.FIGHT_CLUB

func _init():
	return

func try_process():
	if source != null and card != null and target != null:
		target.process_transaction(card.props.transaction, source)
		fight_club.hand.remove_card(card)
		fight_club.discard_pile.add_card(card)
		clear()

func add_source(source_):
	source = source_
	try_process()

func add_card(card_):
	# actually adds the card
	card = card_
	try_process()

func add_target(target_):
	target = target_
	try_process()

func clear():
	source = null
	card = null
	target = null
