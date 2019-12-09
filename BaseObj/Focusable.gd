extends Node2D
class_name Focusable

var focused
var props = {}

func init(_props):
	"""
	props_:
		# focusable
		focus_manager: FocusManager, the Focus manager that the Focusable will
		connect to
	"""
	focused = false

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
