extends Node2D
class_name FightOrchestrator

var props = {}

var fight_club
var ent_index = 0

func _init(props_):
	"""
	props_:
		hostiles: CursorArea
	"""
	props = props_
	fight_club = Global.FIGHT_CLUB

func combobulate():
	fight_club.fight_orchestrator = self

	# add friendlies to self
	fight_club.friendlies.position = Vector2(150, 150)
	add_child(fight_club.friendlies)

	# set and adds hostiles to self
	fight_club.hostiles = props.hostiles
	fight_club.hostiles.position = Vector2(250, 150)
	add_child(fight_club.hostiles)

	fight_club.hand = Hand.new()
	add_child(fight_club.hand)
	fight_club.hand.position = Vector2(123, 270)

	fight_club.draw_pile = DrawPile.new()
	add_child(fight_club.draw_pile)

	fight_club.transaction_interface = TransactionInterface.new()

func fight_order():
	return fight_club.friendlies.props.cells + fight_club.hostiles.props.cells

func run_preround():
	var ents = fight_order()

	for ent in ents:
		ent.prepare()

func run_round():
	var ents = fight_order()

	for ent in ents:
		ent.act()

func cont():
	"""
	passes turn to the next entity
	"""
	fight_order()[ent_index].act()
	ent_index = (ent_index + 1) % fight_order().size()

func start():
	combobulate()
	fight_club.draw_pile.load_from_deck()
	cont()