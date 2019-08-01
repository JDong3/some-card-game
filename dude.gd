extends KinematicBody2D

const Map = preload("res://Map.tscn")

func _physics_process(delta):
	var leftVec = Vector2(-1, 0)
	var rightVec = Vector2(1, 0)
	var upVec = Vector2(0, -1)
	var downVec = Vector2(0, 1)
	
	if Input.is_action_pressed('ui_left'):
		move_and_collide(leftVec)
	if Input.is_action_pressed('ui_right'):
		move_and_collide(rightVec)
	if Input.is_action_pressed('ui_up'):
		move_and_collide(upVec)
	if Input.is_action_pressed('ui_down'):
		move_and_collide(downVec)

func _ready():
	pass

func _process(delta):
	var mapInst = Map.instance()
	
	if Input.is_key_pressed(1):
		pass