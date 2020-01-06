extends Bass
class_name Cell

"""
A Cell is an object that lives inside of a CursorGrid or CursorArea, it is seen
by the player as a Sprite.

implement:
	input(event)
"""

func init(_props):
	"""
	_props:
		sprite: Sprite, the Sprite that is seen by the player by default
		selected_sprite: Sprite, the Sprite that is overlayed on top of the
			regular sprite
	"""
	for key in _props.keys():
		props[key] = _props[key]
	add_child(props.sprite)

	return self

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
	pass