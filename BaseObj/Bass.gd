extends Node2D
class_name Bass

var is_move = false # whether the objects moves or not
var focused = false

func init(_props):
	"""
	props_:

		# focusable
		focus_manager: FocusManager, the Focus manager that the Focusable will
		connect to

	"""
	pass

# moveable
func input_move(event):
	if event.is_action_pressed('roam_up'):
		position.y += 10
	if event.is_action_pressed('roam_down'):
		position.y -= 10
	if event.is_action_pressed('roam_left'):
		position.x -= 10
	if event.is_action_pressed('roam_right'):
		position.x += 10

func input(event):
	if is_move:
		input_move(event)

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
