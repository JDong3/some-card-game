extends Node2D

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
	
	combobulate()
	
func combobulate():
	var width = config.dimensions.x
	var height = config.dimensions.y
	var curr_position = position
	var cell
	
	# fills boxes in left to right, up to down
	for i in range(height):
		for j in range(width):
			# load the cells in, and set their position
			cell = config.cells[i * j]
			add_child(cell)
			print('loading cells in and setting their position', cell)
			print(curr_position)

func _input(event):
	pass