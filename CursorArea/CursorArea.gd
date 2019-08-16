extends Node2D
class_name CursorArea

"""
cells are used in cursor areas
"""

var config
var default_cursor_position = 0
var width
var height
var cell_width
var cell_height
var selected_sprite

var cursor_position

# get from the focus manager
var focus_interface


func _init(config_map):
	"""
	:param config_map: dictionary describing the configuration of the CursorArea object
	config_map:
		dimensions: Vector2, the number of cells per column and row
		cell_size: Vector2, the pixel w by h of each cell
		size: Vector2, the pixel w by h of the cursor area
		default_cursor_position: null
		cells: list of Cells that are the cells
		seleted_sprite: sprite, the highlight that shows up when when a cell is 'hovered'
		focus_interface: a focus interface from the appropriate manager
	"""
	config = config_map
	cursor_position = default_cursor_position
	width = config.dimensions.x
	height = config.dimensions.y
	cell_width = config.cell_size.x
	cell_height = config.cell_size.y
	selected_sprite = config.selected_sprite
	focus_interface = config.focus_interface
		
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
			cell.position = Vector2(curr_position.x, curr_position.y)
			add_child(cell)
			
			curr_position.x += cell_width
			
		curr_position.y += cell_height
	
	get_child(cursor_position).select()

func move_cursor_to(index):
	if index >= config.cells.size() or index < 0:
		return
		
	config.cells[cursor_position].remove_child(selected_sprite)
	config.cells[index].add_child(selected_sprite)
	cursor_position = index

func _input(event):
	
	if !focus_interface.has_focus():
		return

	if event.is_action_released('cursor_up'):
		move_cursor_to(cursor_position - width)
	elif event.is_action_released('cursor_down'):
		move_cursor_to(cursor_position + width)
	elif event.is_action_released('cursor_left'):
		move_cursor_to(cursor_position + 1)
	elif event.is_action_released('cursor_right'):
		move_cursor_to(cursor_position - 1)
	elif event.is_action_released('cursor_select'):
		print('select')
	