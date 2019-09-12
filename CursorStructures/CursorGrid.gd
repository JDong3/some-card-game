extends Focusable
class_name CursorGrid
"""
cells are used in cursor areas
"""

# state
var cursor_position = 0

# get from the focus manager
# var focus_interface


func init(props_):
	"""
	:param props_: dictionary describing the configuration of the CursorGrid object
	props_:
		cell_size: Vector2, the pixel w by h of each cell
		cells: list of Cells that are the cells
		cursor_position?: null
		dimensions: Vector2, the number of cells per column and row
		focus_interface: a focus interface from the appropriate manager
		size: Vector2, the pixel w by h of the cursor area
	"""
	for key in props_.keys():
		props[key] = props_[key]
	combobulate()

	return self

func focus():
	"""
	focuses on the cursor grid selects the correct cell to highlight
	"""
	obtain_sole_focus()
	props.cells[cursor_position].select()

func combobulate():
	"""
	puts together the stuff
	"""
	var curr_position = position
	var cell
	var index

	# algorithm to lay out the cells in a grid
	for i in range(props.dimensions.y):

		curr_position.x = position.x

		for j in range(props.dimensions.x):
			index = (i * j) + i + j

			cell = props.cells[index]
			cell.position = Vector2(curr_position.x, curr_position.y)
			add_child(cell)

			curr_position.x += props.cell_size.x

		curr_position.y += props.cell_size.y

func move_cursor_to(index):
	if index >= props.cells.size() or index < 0:
		return

	props.cells[cursor_position].deselect()
	props.cells[index].select()
	cursor_position = index

func input(event):

	if event.is_action_released('cursor_up'):
		move_cursor_to(cursor_position - props.dimensions.x)
	elif event.is_action_released('cursor_down'):
		move_cursor_to(cursor_position + props.dimensions.x)
	elif event.is_action_released('cursor_left'):
		move_cursor_to(cursor_position - 1)
	elif event.is_action_released('cursor_right'):
		move_cursor_to(cursor_position + 1)
	else:
		props.cells[cursor_position].input(event)
