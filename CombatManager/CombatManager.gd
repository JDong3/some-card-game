extends Node
class_name CombatManager

var uid_generator
var interfaces

func _init():
	"""
	initializes the UidGenerator and the dict of tracked interfaces
	for the CombatManager
	"""
	uid_generator = UidGenerator.new()
	interfaces = {}

func _obtain_interface():
	"""
	returns a CombatInterface for this manager that is added to the dict
	of tracked interfaces and is uniquely identifiable within this
	combat manager
	:returns: CombatInterface, a new CombatInterface which is attached
	to this CombatManager
	"""
	var res
	var combat_manager = self
	var uid = uid_generator.obtain_uid()

	res = CombatInterface.new(combat_manager, uid)

	# add interface to dict of tracked interfaces
	interfaces[uid] = res
	return res