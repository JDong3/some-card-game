extends Node2D
class_name Focusable

"""
Class that is appropriate for connecting to focus interface
"""

var props = {}

func init(props_):
	"""
	props_:
		focus_manager: FocusManager
	"""
	pass

func on_focus():
	pass

func on_defocus():
	pass

func obtain_shared_focus():
	props['focus_manager'].add_to_focus(self)

func obtain_sole_focus():
	props['focus_manager'].set_sole_focus(self)

func has_focus():
	return props['focus_manager'].has_focus(self)