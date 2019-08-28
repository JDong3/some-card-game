extends Node
class_name Character

var combat_interface

func _init(config_):
	"""
	config:
		sprite: use this one, this will be replaced in actuall version
		animated_sprite: not implemented yet
	"""
	combat_interface = Global.GameCombatManager.obtain_interface()
