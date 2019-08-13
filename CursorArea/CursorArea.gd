extends Node2D

var config
var cursor_position
var width
var height
var cell_width
var cell_height


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
	width = config.dimensions.x
	height = config.dimensions.y
	cell_width = config.cell_size.x
	cell_height = config.cell_size.y
	
	combobulate()
	
func combobulate():
	"""
	puts together the stuff
	"""
	var curr_position = position
	var cell
	var index
	
	# algorithm to lay out the cells in a grid
	for i in range(height):
		
		curr_position.x = position.x
		
		for j in range(width):
			index = (i * j) + i + j
			
			cell = config.cells[index]
			cell.set_centered(false)
			cell.position = Vector2(curr_position.x, curr_position.y)
			add_child(cell)
			
			curr_position.x += cell_width
			
		curr_position.y += cell_height

func _input(event):
	pass