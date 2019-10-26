extends Node2D
class_name Bass

var is_move = false # whether the objects moves or not
var focused = false

var is_move_left
var is_move_right
var is_move_up
var is_move_down

func init(_props):
	"""
	props_:
		# focusable
		focus_manager: FocusManager, the Focus manager that the Focusable will
		connect to
	"""
	is_move = false
	focused = false

	is_move_left = false
	is_move_right = false
	is_move_up = false
	is_move_down = false
	pass

# moveable
func input_move(event):
	if event.is_action_pressed('roam_up'):
		is_move_up = true
	if event.is_action_released('roam_up'):
		is_move_up = false
	if event.is_action_pressed('roam_down'):
		is_move_down = true
	if event.is_action_released('roam_down'):
		is_move_down = false
	if event.is_action_pressed('roam_left'):
		is_move_left = true
	if event.is_action_released('roam_left'):
		is_move_left = false
	if event.is_action_pressed('roam_right'):
		is_move_right = true
	if event.is_action_released('roam_right'):
		is_move_right = false

func input(event):
	if is_move:
		input_move(event)

func _process(delta):
	if is_move_up:
		position.y -= delta * 50
	if is_move_down:
		position.y += delta * 50
	if is_move_right:
		position.x += delta * 50
	if is_move_left:
		position.x -= delta * 50

# focusable
func on_focus():
	"""
	a function that is run by the FocusManager when the Focusable gains input
	routing
	:return: null
	"""
	pass

func on_defocus():
	"""
	a function that is run by the FocusManager when the Focusable loses input
	routing
	:return: null
	"""
	pass

func obtain_shared_focus():
	"""
	adds self to a list of Focusables that receives input routing
	:return: null
	"""
	props['focus_manager'].add_to_focus(self)

func obtain_sole_focus():
	"""
	removes input routing from all other Focusables, and gives self input
	routing
	:return: null
	"""
	props['focus_manager'].set_sole_focus(self)

func defocus():
	props.focus_manager.remove_focus(self)

func has_focus():
	"""
	gives whether self currently has input routing
	:return: null
	"""
	return props['focus_manager'].has_focus(self)

var is_selected = false
var props = {}

# selectable
func select():
	is_selected = true

func deselect():
	is_selected = false
