extends Node2D
class_name Selectable

"""
implement:
	select
	deselect
	input
"""


var is_selected = false

func init(props_):
	pass
	return self

func select():
	is_selected = true

func deselect():
	is_selected = false

func input(event):
	pass
