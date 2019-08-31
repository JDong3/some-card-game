extends ConnectedCursorArea # note: change to curtor area later
class_name Hand

func make_props():
	var cells = []
	for i in range(5):
		cells.append(TestCardCell.new({'source': 'a'}))

	var res = {
		'dimensions': Vector2(5, 1),
		'cells': cells,
		'focus_interface': Global.GameFocusManager.obtain_interface('hand'),
		'cursor_hub': CursorHub.new(),
		'id': 'hand'
	}
	return res

func _init().(make_props()):
	"""
	props:
		cards: list of Card objects
	"""
	combobulate()

func add_cell(cell, n):
	"""
	:param cell: the cell that you want to add to the CursorArea
	:param n: the position you want to add the cell to
	"""
	var pos_x = 0 + (48 * n)
	var pos_y = 0
	add_child(cell)
	cell.set_position(Vector2(pos_x, pos_y))
