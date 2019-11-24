extends Node
class_name TransactionInterface

var source # combat entity
var cards # transaction dictionary
var targets # list of combat entities
var fight_club = Global.FIGHT_CLUB

func _init():
	targets = []
	cards = []
	return

func try_process():
	source.on_card()
	#if source != null and card != null and targets != null:
		#for target in targets:
		#	source.send_transaction(card.props.transaction, target)
		#fight_club.hand.remove_card(card)
		#fight_club.discard_pile.add_card(card)
		#clear()

func add_source(source_):
	source = source_

func add_card(card_):
	# actually adds the card
	cards.push_back(card_)

func add_target(target_):
	targets.append(target_)

func clear():
	source = null
	cards = []
	targets = []
