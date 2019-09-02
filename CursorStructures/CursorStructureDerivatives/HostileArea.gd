extends ConnectedCursorArea
class_name HostileArea

func make_props():
	var res = {}
	return res

func _init().(make_props()):
	pass

func add_cell(cell, n):
	"""
	:param cell: Cell
	:param n: int
	"""
	var pos_x = 0 + (50 * n)
	var pos_y = 0

	add_child(cell)
	cell.set_position(Vector2(pos_x, pos_y))