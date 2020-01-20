extends Node2D
class_name Selectable

var is_selected = false

# selectable
func select():
	is_selected = true

func deselect():
	is_selected = false
