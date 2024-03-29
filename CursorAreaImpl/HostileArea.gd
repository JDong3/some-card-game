extends EntArea
class_name HostileArea

func _init():
	props['id'] = 'hostile'
	props['cells'] = [EdudEntity.new(), EdudEntity.new()]
	props['focus_manager'] = Global.GAME_FOCUS_MANAGER

	.init(props)

func attach_cell(cell):
	"""
	:param cell: Cell
	:param n: int
	"""
	var n = cells.find(cell)

	var pos_x = 0 + (50 * n)
	var pos_y = 0
	add_child(cell)
	cell.set_position(Vector2(pos_x, pos_y))

func input(event):
	.input(event)
