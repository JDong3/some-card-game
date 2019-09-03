extends Node
class_name FocusInterface

var manager
var id

func _init(manager_obj, id_str):
	manager = manager_obj
	id = id_str

func obtain_focus():
	manager.set_focus(id)

func has_focus():
	return manager.has_focus(id)