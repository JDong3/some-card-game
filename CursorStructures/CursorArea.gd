extends Bass
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
	# render cells
	for child in get_children():
		remove_child(child)

	for cell in cells:
		attach_cell(cell)

	# render cursor
	for cell in cells:
		cell.deselect()

	if single_target:
		if cells.size() > 0 and focused:
			cells[cursor_position].select()

	if group_target and focused:
		for cell in cells:
			cell.select()


func input(event):
	"""
	handles cursor_next and cursor_previous inputs
	:param event: InputEvent
	:return: null
	"""
	# if there are no cells in the area ignore cursor_next and prev inputs
	if cells.size() == 0:
		return
	if single_target:
		single_target_input(event)

	if multi_target:
		multi_target_input(event)

func single_target_input(event):
	if event.is_action_released('cursor_next'):
			cursor_position = (cursor_position + 1) % cells.size()
	elif event.is_action_released('cursor_previous'):
			cursor_position = (cursor_position - 1) % cells.size()
	render()

func multi_target_input(event):
	pass

func group_target_input(event):
	pass

func on_defocus():
	focused = false
	render()

func on_focus():
	focused = true
	render()


# targeting module

func clear_targeting_mode():
	single_target = false
	multi_target = false
	group_target = false

func set_single_target_mode():
	clear_targeting_mode()
	single_target = true
	render()

func set_multi_target_mode():
	clear_targeting_mode()
	multi_target = true

func set_group_target_mode():
	clear_targeting_mode()
	group_target = true
	render()
