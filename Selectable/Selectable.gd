extends Node2D
class_name Selectable

"""
implement:
	select
	deselect
	input
"""


var is_selected = false
var props = {}


func init(props_):
	props = props_
	return self

func select():
	is_selected = true

func deselect():
	is_selected = false

func input(event):
	pass
