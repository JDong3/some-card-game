extends Node2D
class_name Cell

"""
A Cell is an object that lives inside of a CursorGrid or CursorArea, it is seen
by the player as a Sprite.

implement:
	input(event)
"""

var props

# state
var is_selected = false

func _init(props_in):
	"""
	constructor of the Cell object
	:param props: Dictionary, configuration for the Cell object
	props_:
		sprite: Sprite, the Sprite that is seen by the player by default
		selected_sprite: Sprite, the Sprite that is overlayed on top of the
			regular sprite
	"""
	props = props_in
	add_child(props.sprite)

func select():
	"""
	overlays the selected_sprite onto the regular sprite
	:return: null
	"""
	if !is_selected:
		add_child(props.selected_sprite)
		is_selected = true

func deselect():
	"""
	removes overlayed selected_sprite
	:return: null
	"""
	if is_selected:
		remove_child(props.selected_sprite)
		is_selected = false

func input(event):
	"""
	handles inputs that are forwarded from parent CursorArea, must be
	implemented by derivatives
	:param event: InputEvent
	:return: null
	"""
	print('please implement this function', self, event)