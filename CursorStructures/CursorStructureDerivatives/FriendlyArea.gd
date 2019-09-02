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
	props['cells'] = [TestCardCell.new({'source': 'a'}), TestCardCell.new({'source': 'a'})]
	props['focus_interface'] = Global.GAME_FOCUS_MANAGER.obtain_interface()

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
