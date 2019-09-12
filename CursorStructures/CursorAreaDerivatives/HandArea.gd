extends ConnectedCursorArea # note: change to curtor area later
class_name Hand



func _init(props_):
	"""
	props:
		cells: Array<Card>
		cursor_hub: CursorHub
	"""
	props = props_

	props['focus_manager'] = Global.GAME_FOCUS_MANAGER
	props['id'] = 'hand'

	.init(props)

func add_cell(cell, n):
	"""
	:param cell: the cell that you want to add to the CursorArea
	:param n: the position you want to add the cell to
	"""
	var pos_x = 0 + (48 * n)
	var pos_y = 0
	add_child(cell)
	cell.set_position(Vector2(pos_x, pos_y))

func input(event):

	.input(event)

	if event.is_action_released('cursor_select'):
		props['cells'][cursor_position].input(event)
		props['cursor_hub'].send_focus('hostile')