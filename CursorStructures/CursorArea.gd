extends Node2D

"""
same as cursor area, but you need to provice your own combobulate function
"""

var props

var cursor_position = 0

func _init(props_):
	"""
	props:
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

func add_cell(cell):
	print('implement add_cell', self)

func combobulate():
	print('implement combobulate', self)

func input(event):
	print('implement cursor_next/cursor_previous')