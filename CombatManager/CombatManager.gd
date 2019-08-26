extends Node
class_name CombatManager

var uid_generator
var friendlies
var enemies

func _init():
	"""
	initializes the UidGenerator and the dict of tracked interfaces
	for the CombatManager
	"""
	friendlies = []
	enemies = []
