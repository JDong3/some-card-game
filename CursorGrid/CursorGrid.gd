extends Node2D
class_name CursorGrid
"""
cells are used in cursor areas
"""

var config
var default_cursor_position = 0

# state
var cursor_position

# get from the focus manager
# var focus_interface


func _init(config_map):
	"""
	:param config_map: dictionary describing the configuration of the CursorGrid object
	config_map:
		dimensions: Vector2, the number of cells per column and row
		cell_size: Vector2, the pixel w by h of each cell
		size: Vector2, the pixel w by h of the cursor area
		default_cursor_position: null
		cells: list of Cells that are the cells
		focus_interface: a focus interface from the appropriate manager
	"""
	config = config_map
	cursor_position = default_cursor_position
	config.focus_interface.obtain_focus()

	combobulate()

func combobulate():
	"""
	puts together the stuff
	"""
	var curr_position = position
	var cell
	var index

	# algorithm to lay out the cells in a grid
	for i in range(config.dimensions.y):

		curr_position.x = position.x

		for j in range(config.dimensions.x):
			index = (i * j) + i + j

			cell = config.cells[index]
			cell.position = Vector2(curr_position.x, curr_position.y)
			add_child(cell)

			curr_position.x += config.cell_size.x

		curr_position.y += config.cell_size.y

	get_child(cursor_position).select()

func move_cursor_to(index):
	if index >= config.cells.size() or index < 0:
		return

	config.cells[cursor_position].deselect()
	config.cells[index].select()
	cursor_position = index

func _input(event):

	if !config.focus_interface.has_focus():
		return

	if event.is_action_released('cursor_up'):
		move_cursor_to(cursor_position - config.dimensions.x)
	elif event.is_action_released('cursor_down'):
		move_cursor_to(cursor_position + config.dimensions.x)
	elif event.is_action_released('cursor_left'):
		move_cursor_to(cursor_position + 1)
	elif event.is_action_released('cursor_right'):
		move_cursor_to(cursor_position - 1)
	else:
		config.cells[cursor_position].input(event)
