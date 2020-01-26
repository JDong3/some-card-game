extends Node2D
class_name Movable

var is_move_left
var is_move_right
var is_move_up
var is_move_down

func _init():
	pass

func input(event):
	if event.is_action_pressed('roam_up'):
		is_move_up = true
	if event.is_action_released('roam_up'):
		is_move_up = false
	if event.is_action_pressed('roam_down'):
		is_move_down = true
	if event.is_action_released('roam_down'):
		is_move_down = false
	if event.is_action_pressed('roam_left'):
		is_move_left = true
	if event.is_action_released('roam_left'):
		is_move_left = false
	if event.is_action_pressed('roam_right'):
		is_move_right = true
	if event.is_action_released('roam_right'):
		is_move_right = false

func _physics_process(delta):

	var parent = get_parent()
	var motion = Vector2()
	motion.x = 0

	var GRAVITY = Vector2(0, 20)
	var SPEED = 50

	if is_move_up:
		motion.y -= SPEED
	if is_move_down:
		motion.y += SPEED
	if is_move_left:
		motion.x -= SPEED
	if is_move_right:
		motion.x += SPEED

	motion += GRAVITY
	parent.move_and_slide(motion, Vector2(0, -1))

func _process(delta):
	return
	var speed = 100
	if is_move_up:
		get_parent().position.y -= delta * speed
	if is_move_down:
		get_parent().position.y += delta * speed
	if is_move_right:
		get_parent().position.x += delta * speed
	if is_move_left:
		get_parent().position.x -= delta * speed
