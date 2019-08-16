extends Node
class_name FocusManager

var FocusInterface = load('res://FocusManager/FocusInterface.gd')
var interfaces = []
var focused_on

func obtain_interface(id):
	"""
	returns a FocusInterface object and adds it the the tracked
	interfaces of the current FocusManager
	:param id: id of the interface you want to obtain, id
	just used for object matching, please don't duplicate names
	"""
	var res = FocusInterface.new(self, id)
	interfaces.append(res)
	return res

func set_focus(id):
	focused_on = id

func has_focus(id):
	return focused_on.casecmp_to(id) == 0