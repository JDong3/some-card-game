extends Node2D
class_name CursorArea

"""
same as cursor grid, but you need to provice your own combobulate function,
"""

var props

var cursor_position = 0

func _init(props_):
	"""
	props:
		focus_interface: FocusInterface obj
		cells: list of Cells that are contained in the CursorArea,
		cursor_position?: specify an optional default cursor position
		reverse=false: cursor_next decrements position and cursor_prev
			increments position, this is for CursorAreas where the cells are
			created from right to left
	"""
	props = props_

	# if reverse is not specified use default false
	if !props.has('reverse'):
		props['reverse'] = false

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

func input(event):
	print('implement cursor_next/cursor_previous')