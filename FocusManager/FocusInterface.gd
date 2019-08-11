extends Node

var manager
var id

func _init(manager_obj, id_str):
	manager = manager_obj
	id = id_str

func obtainFocus():
	manager.setFocus(id)
	
func hasFocus():
	manager.hasFocus(id)