extends CursorArea
class_name Hand

var fight_club
var hand_size = 8

func _init():
	fight_club = Global.FIGHT_CLUB

	props.cells = []
	props.focus_manager = Global.GAME_FOCUS_MANAGER

	.init(props)

func attach_cell(cell):
	"""
	attaches a cell that is found in state.cells
	:param cell: the cell that you want to add to the CursorArea
	"""
	var n = cells.find(cell)

	var pos_x = 0 + (48 * n)
	var pos_y = 0
	add_child(cell)
	cell.set_position(Vector2(pos_x, pos_y))

func add_card(card, render=true):
	if cells.size() < hand_size:
		cells.push_back(card)
	else:
		fight_club.discard_pile.add_card(card)

	if render:
		render()

func remove_card(card):
	cells.erase(card)
	render()

func draw(n=1):
	"""
	draws from the DrawPile in the fight_club
	"""
	for i in range(n):
		var card = fight_club.draw_pile.give()

		# if the draw pile starts to give you nothing stop drawing
		if card == null:
			break

		card.props.source = fight_club.friendlies.cells[0]
		add_card(card)

func on_focus():
	"""
	if you use the last card in your hand, the Hand will cause a crash when
	it is refocused, since the card is removed but the cursor_position is still
	on the end of the Hand
	"""
	# if cursor goes out of bounds on the top end bring it back in
	if cursor_position > cells.size() - 1:
		cursor_position = cells.size() - 1

		if cursor_position == -1:
			cursor_position = 0
		print(cursor_position)
	.on_focus()

func handle_cursor_select(event):
	"""
	handles cursor select event
	"""
	# if the card cannot be played, send error

	# send the focus to the correct area (see transaction)

func group_target_event_input():
	pass

func input(event):
	var card = cells[cursor_position]

	var ent_area

	if card.metadata.target_hostile:
		ent_area = fight_club.hostiles
	else:
		ent_area = fight_club.friendlies

	# if hand is empty don't bother handling input
	if cells.size() == 0:
		return

	if event.is_action_released('cursor_select'):
		if card.metadata.target_hostile:
			fight_club.hostiles.obtain_sole_focus()

			if card.metadata.single_target:
				fight_club.a
		else:
			fight_club.friendlies.obtain_sole_focus()
		cells[cursor_position].input(event)

	if event.is_action_released('combat_end_turn'):
		fight_club.fight_orchestrator.cont()

	.input(event)