extends Node2D

func _input(event):
	if event.is_action_released('dev_battle'):
		get_tree().change_scene('res://Battle/Battle.tscn')
