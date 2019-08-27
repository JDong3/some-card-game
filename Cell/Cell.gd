extends Node2D
class_name Cell

"""
A Cell is an object that lives inside of a CursorGrid or CursorArea, it is seen
by the player as a Sprite. It must also provide a Sprite that is overlayed on
the main sprite to show that the Cell is currently selected. The input function
which determines what happens when the sprite receives a select input must
be implemented by a child object.
"""

var props

# state
var is_selected = false

func _init(props_in):
	"""
	props:
		sprite: the main CellSprite of the node
		selected_sprite: the sprite overlay to show that the cell is selected
	"""
	props = props_in
	add_child(props.sprite)

func select():
	if !is_selected:
		add_child(props.selected_sprite)
		is_selected = true

func deselect():
	if is_selected:
		remove_child(props.selected_sprite)
		is_selected = false

func input(event):
	"""
	manually forward input to this node
	"""
	print('please implement this function', self)