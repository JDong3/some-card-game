extends Node2D

var selected

func _init(props):
	"""
	props:
		sprite: the main sprite of the node
		selected_sprite: the sprite overlay to show that the cell is selected
	"""
	pass

func select():
	pass

func deselect():
	pass

func input(event):
	"""
	manually forward input to this node
	"""
	if event.is_action_pressed('cursor_select'):
		print('please implement this function')