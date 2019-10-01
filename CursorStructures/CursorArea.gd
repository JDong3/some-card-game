extends Focusable
class_name CursorArea

"""
same as cursor grid, but you need to provice your own render function,
"""

var cursor_position
var cells

# targeting modes
var single_target = true # default mode
var multi_target = false
var group_target = false


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

	if props.has('cells'):
		cells = props.cells
	# if reverse is not specified use default false
	if !props.has('reverse'):
		props.reverse = false
	if !props.has('cursor_position'):
		props.cursor_position = 0

	cursor_position = props.cursor_position
	cells = props.cells

	render()

	return self

func attach_cell(cell):
	"""
	it is standard to put the first cell at 0, 0 as child
	"""
	pass

func render():
	"""
	takes all cells in props.cells and combobulates them onto the object
	:return: null
	"""
	for child in get_children():
		remove_child(child)

	var i = 0
	for cell in cells:
		attach_cell(cell)
		i += 1

func input(event):
	"""
	handles cursor_next and cursor_previous inputs
	:param event: InputEvent
	:return: null
	"""
	# if there are no cells in the area ignore cursor_next and prev inputs
	if cells.size() == 0:
		return

	if event.is_action_released('cursor_next'):
		cells[cursor_position].deselect()
		cursor_position = (cursor_position + 1) % cells.size()
		cells[cursor_position].select()
	elif event.is_action_released('cursor_previous'):
		cells[cursor_position].deselect()
		cursor_position = (cursor_position - 1) % cells.size()
		cells[cursor_position].select()

func on_defocus():
	props.cells[cursor_position].deselect()

func on_focus():
	if cells.size() > 0:
		props.cells[cursor_position].select()


# targeting module
func clear_targeting_mode():
	single_target = false
	multi_target = false
	group_target = false

func set_single_target_mode():
	clear_targeting_mode()
	single_target = true

func set_multi_target_mode():
	clear_targeting_mode()
	multi_target = true

func set_group_target_mode():
	clear_targeting_mode()
	group_target = true
