extends Area2D

const FourNode = preload('res://Floor/FourNode.gd')

func _ready():
	var myFourNode = FourNode.new('xd')
	pass # Replace with function body.

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed('click'):
		get_tree().change_scene('res://CharacterSelect/CharacterSelect.tscn')