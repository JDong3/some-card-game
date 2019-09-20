extends CursorArea
class_name HostileArea

func _init():
	props['id'] = 'hostile'
	props['cells'] = [EdudEntity.new({}), EdudEntity.new({})]
	props['focus_manager'] = Global.GAME_FOCUS_MANAGER
	props.fight_club = Global.FIGHT_CLUB

	.init(props)

func add_cell(cell, n):
	"""
	:param cell: Cell
	:param n: int
	"""
	var pos_x = 0 + (50 * n)
	var pos_y = 0

	add_child(cell)
	cell.set_position(Vector2(pos_x, pos_y))

func input(event):
	.input(event)

	if event.is_action_released('combat_swap'):
		props.fight_club.friendlies.obtain_sole_focus()
	if event.is_action_released('combat_back'):
		props.fight_club.hand.obtain_sole_focus()
	if event.is_action_released('cursor_select'):
		props.cells[cursor_position].input(event)
		props.fight_club.hand.obtain_sole_focus()
