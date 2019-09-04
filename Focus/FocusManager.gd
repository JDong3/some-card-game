extends Node
class_name FocusManager

var interfaces = []
var focused_on = []
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

func set_sole_focus(id):
	focused_on.clear()
	focused_on.append(id)

func add_to_focus(id):
	focused_on.append(id)


func has_focus(id):
	return focused_on.has(id)