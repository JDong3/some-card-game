extends ConnectedCursorArea
class_name HostileArea

func _init(props_):
	"""
	props_:
		cursor_hub: CursorHub
	"""
	for key in props_.keys():
		props[key] = props_[key]

	props['id'] = 'friendly'
	props['cells'] = [EdudEntity.new({}), EdudEntity.new({})]
	props['focus_manager'] = Global.GAME_FOCUS_MANAGER

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