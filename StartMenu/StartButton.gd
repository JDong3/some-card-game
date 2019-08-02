extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene("res://GameView/GameView.tscn")
		

	