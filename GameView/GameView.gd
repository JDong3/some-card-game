extends Node2D

func _ready():
	add_child(Global.GAME_FOCUS_MANAGER)

func _input(event):
	if event.is_action_released('dev_battle'):
		remove_child(Global.GAME_FOCUS_MANAGER)
		get_tree().change_scene('res://Battle/Battle.tscn')
