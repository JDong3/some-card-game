extends ConnectedCursorArea
class_name FriendlyArea

func make_props():
	var res = {
		'id': 'friendly'
	}
	return res

func _init(props_).(make_props()):
	"""
	props_:
		cursor_hub: CursorHub
	"""
	props['cursor_hub'] = props_['cursor_hub']
	props['cursor_hub'].add_cursor_area(self, props['id'])

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
