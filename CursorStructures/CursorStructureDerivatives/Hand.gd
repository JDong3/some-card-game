extends ConnectedCursorArea # note: change to curtor area later
class_name Hand

func make_props():
	var cells = []
	for i in range(5):
		cells.append(TestCardCell.new({'source': 'a'}))

	var res = {
		'dimensions': Vector2(5, 1),
		'cell_size': Vector2(48, 62),
		'size': 'not used atm', # note: this might crash in the future,
		'cells': cells,
		'focus_interface': Global.GameFocusManager.obtain_interface('hand')
	}
	return res

func _init().(make_props()):
	"""
	props:
		cards: list of Card objects
	"""
	combobulate()
	return

func add_cell(cell, n):
	"""
	:param cell: the cell that you want to add to the CursorArea
	:param n: the position you want to add the cell to
	"""
	if n == 0:
		add_child(cell)
		cell.set_position()
		pass

	return


func input(event):
	return