extends Node2D
class_name Cell

var selected
var props

var is_selected = false

func _init(props_in):
	"""
	props:
		sprite: the main sprite of the node
		selected_sprite: the sprite overlay to show that the cell is selected
	"""
	props = props_in
	props.sprite.set_centered(false)
	props.selected_sprite.set_centered(false)
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