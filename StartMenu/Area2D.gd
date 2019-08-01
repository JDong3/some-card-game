extends Area2D

func _ready():
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		get_tree().change_scene('res://GameView/Main.tscn')