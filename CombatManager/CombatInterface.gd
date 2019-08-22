extends Node
class_name CombatInterface

var combat_manager
var uid

# dot
var poison
var bleed

# atk mods (when sending damage)
var weaken

# def mods (when receiving damage)
var vulnerability
var evasion

# block mods
var frail

func _init(combat_manager_, uid_):
	"""
	constructor for CombatInterface, should only be used by a CombatManager
	"""
	combat_manager = combat_manager_
	uid = uid_
