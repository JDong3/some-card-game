extends Node2D
class_name Event

var props = {}

func init(_props):
	props = _props


func start():
	pass

func end():
	"""
	triggered on current event when change_event is emitted
	"""
	pass
