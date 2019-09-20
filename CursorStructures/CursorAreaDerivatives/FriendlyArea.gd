extends CursorArea
class_name FriendlyArea

func _init():
	props.cells = [DudeEntity.new({})]
	props.focus_manager = Global.GAME_FOCUS_MANAGER
	props.fight_club = Global.FIGHT_CLUB
	.init(props)

func add_cell(cell, n):
	"""
	adds a cell at position n in the CursorArea
	:param cell: Cell
	:param n: int
	:return: null
	"""
	var pos_x = 0 - (50 * n)
	var pos_y = 0
	self.add_child(cell)
	cell.set_position(Vector2(pos_x, pos_y))
	pass

func input(event):
	.input(event)

	if event.is_action_released('combat_swap'):
		props.fight_club.hostiles.obtain_sole_focus()
	if event.is_action_released('combat_back'):
		props.fight_club.hand.obtain_sole_focus()
	if event.is_action_released('cursor_select'):
		props.cells[cursor_position].input(event)
		props.fight_club.hand.obtain_sole_focus()