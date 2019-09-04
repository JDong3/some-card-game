extends Node
class_name FocusInterface

var manager
var id

func _init(manager_obj, id_str):
	manager = manager_obj
	id = id_str

func obtain_sole_focus():
	manager.set_sole_focus(id)

func obtain_shared_focus():
	manager.add_to_focus(id)

func has_focus():
	return manager.has_focus(id)

