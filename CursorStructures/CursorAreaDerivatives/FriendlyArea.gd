extends ConnectedCursorArea
class_name FriendlyArea

func _init(props_):
	"""
	props_:
		cursor_hub: CursorHub
	"""
	for key in props_.keys():
		props[key] = props_[key]

	props['id'] = 'friendly'
	props['cells'] = [DudeEntity.new({}), DudeEntity.new({})]
	props['focus_manager'] = Global.GAME_FOCUS_MANAGER

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

	if event.is_action_pressed('combat_swap'):
		props['cursor_hub'].send_focus('hostile')
	if event.is_action_pressed('combat_back'):
		props['cursor_hub'].send_focus('hand')
	if event.is_action_released('cursor_select'):
		props['cells'][cursor_position].input(event)
		props['cursor_hub'].send_focus('hand')