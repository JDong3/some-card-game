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
	return
