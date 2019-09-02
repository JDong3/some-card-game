extends Node
class_name FocusManager

var interfaces = []
var focused_on = ''
var uid_generator = UidGenerator.new()

func obtain_interface():
	"""
	returns a FocusInterface object and adds it the the tracked
	interfaces of the current FocusManager
	:param id: id of the interface you want to obtain, id
	just used for object matching, please don't duplicate names
	"""
	var res = FocusInterface.new(self, uid_generator.obtain_uid())
	interfaces.append(res)
	return res

func set_focus(id):
	focused_on = id

func has_focus(id):
	return id == 0