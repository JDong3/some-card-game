extends Node2D
class_name Movable

var GRAVITY = 50
var ACCELERATION = 50
var FRICTION = 50

var MAX_SPEED = 200
var TERMINAL_VELOCITY = 400


# movement variables, written by input
var input_vars = {
	'roam_left': false,
	'roam_right': false,
	'roam_up': false,
	'roam_down': false,
	'roam_jump': false
}
var roam_left
var roam_right
var roam_up
var roam_down
var roam_Jump

var ie


# walk, jump, climb, don't worry about this it should be auto detected
var mode
var motion

func _init():
	mode = 'walk'
	motion = Vector2()

func input(event):
	print(event.as_text())

	if event.is_action_pressed('roam_up'):
		roam_up = true
	if event.is_action_released('roam_up'):
		roam_up = false
	if event.is_action_pressed('roam_down'):
		roam_down = true
	if event.is_action_released('roam_down'):
		roam_down = false
	if event.is_action_pressed('roam_left'):
		roam_left = true
	if event.is_action_released('roam_left'):
		roam_left = false
	if event.is_action_pressed('roam_right'):
		roam_right = true
	if event.is_action_released('roam_right'):
		roam_right = false
	if event.is_action_pressed('roam_jump'):
		roam_Jump = true

func process_walk():
	"""
	looks at variables, does stuff to the velocity
	"""

func get_mode():
	pass

func _physics_process(delta):

	var parent = get_parent()

	if roam_left:
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	elif roam_right:
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	else:
		if parent.is_on_floor():
			motion.x = lerp(motion.x, 0, 0.2)
		else:
			motion.x = lerp(motion.x, 0, 0.05)

	if !parent.is_on_floor():
		motion.y = min(motion.y + GRAVITY, TERMINAL_VELOCITY)

	if roam_Jump:
		motion.y = -500
		roam_Jump = false


	parent.move_and_slide(motion, Vector2(0, -1))
