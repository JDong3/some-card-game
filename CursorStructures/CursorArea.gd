extends Node2D
class_name CursorArea

"""
same as cursor grid, but you need to provice your own combobulate function,
"""

var props = {}
var cursor_position = 0

func init(props_):
	"""
	props:
		cells: list of Cells that are contained in the CursorArea,
		cursor_position?: specify an optional default cursor position
		focus_interface: FocusInterface obj
		reverse?: cursor_next decrements position and cursor_prev
			increments position, this is for CursorAreas where the cells are
			created from right to left
	"""
	props = props_

	# if reverse is not specified use default false
	if !props.has('reverse'):
		props['reverse'] = false
	if !props.has('cursor_position'):
		props['cursor_position'] = 0

	props.focus_interface.obtain_sole_focus()
	combobulate()

	return self

func add_cell(cell, n):
	"""
	it is standard to put the first cell at 0, 0
	"""
	print('implement add_cell', self)

func combobulate():
	"""
	takes all cells in props.cells and combobulates them onto the object
	:return: null
	"""
	for i in range(props.cells.size()):
		add_cell(props.cells[i], i)

	props.cells[cursor_position].select()

func _input(event):
	if !props.focus_interface.has_focus():
		return

	if event.is_action_released('cursor_next'):
		props.cells[cursor_position].deselect()
		cursor_position = (cursor_position + 1) % props.cells.size()
		props.cells[cursor_position].select()
	elif event.is_action_released('cursor_previous'):
		props.cells[cursor_position].deselect()
		cursor_position = (cursor_position - 1) % props.cells.size()
		props.cells[cursor_position].select()