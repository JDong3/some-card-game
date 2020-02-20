extends Node2D
class_name Movable

var is_move_left
var is_move_right
var is_move_up
var is_move_down
var is_jump


# walk, jump, climb, don't worry about this it should be auto detected
var mode

var motion = Vector2()

func _init():
	mode = 'walk'

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
	if event.is_action_pressed('roam_jump'):
		is_jump = true

func _physics_process(delta):

	var parent = get_parent()

	var GRAVITY = 50
	var ACCELERATION = 50
	var FRICTION = 50

	var MAX_SPEED = 200
	var TERMINAL_VELOCITY = 400

	if is_move_left:
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	elif is_move_right:
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	else:
		if parent.is_on_floor():
			motion.x = lerp(motion.x, 0, 0.2)
		else:
			motion.x = lerp(motion.x, 0, 0.05)

	if !parent.is_on_floor():
		motion.y = min(motion.y + GRAVITY, TERMINAL_VELOCITY)

	if is_jump:
		motion.y = -500
		is_jump = false


	parent.move_and_slide(motion, Vector2(0, -1))
