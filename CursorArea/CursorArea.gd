extends Node

var config
var cursor_position

func _init(config_map):
	"""
	:param config_map: dictionary describing the configuration of the CursorArea object
	config_map:
		dimensions: Vector2, the number of cells per column and row
		cell_size: Vector2, the pixel w by h of each cell
		size: Vector2, the pixel w by h of the cursor area
		default_cursor_position: null
		cells: list of nodes that are the cells
	
	"""
	config = config_map
	cursor_position = 0
	pass
	
func combobulate():
	pass
	
func _input(event):
	pass