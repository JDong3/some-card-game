extends Node2D
class_name FightOrchestrator

var props = {}

var fight_club
var ent_index
var hostiles

func _init(props_):
	"""
	props_:
		hostiles: CursorArea
	"""
	props = props_
	hostiles = props.hostiles
	fight_club = Global.FIGHT_CLUB
	ent_index = -1

func render():
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
	fight_club.hand.position = Vector2(70, 270)

	fight_club.draw_pile = DrawPile.new()
	add_child(fight_club.draw_pile)

	fight_club.discard_pile = DiscardPile.new()
	add_child(fight_club.discard_pile)

	fight_club.transaction_interface = TransactionInterface.new()

func fight_order():
	return fight_club.friendlies.cells + fight_club.hostiles.cells

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
	var all_fainted = true
	for ent in hostiles.cells:
		if !ent.is_faint:
			all_fainted = false

	if all_fainted:
		cleanup()
		start_roam()
		return

	var ents = fight_order()
	ent_index = (ent_index + 1) % fight_order().size()
	ents[ent_index].act()

func cleanup():
	for child in get_children():
		remove_child(child)

func start_roam():
	# make a new ent
	var new_ent = DudeEntity.new()
	add_child(new_ent)
	new_ent.position = Vector2(100, 100)
	new_ent.obtain_sole_focus()
	new_ent.is_move = true

func start():
	render()
	fight_club.draw_pile.load_from_deck()
	cont()