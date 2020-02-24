extends Node2D
class_name Movable

var GRAVITY = 50
var ACCELERATION = 50
var FRICTION = 50

var MAX_SPEED = 200
var TERMINAL_VELOCITY = 400


# movement variables, written by input
var ie = {
	'roam_left': false,
	'roam_right': false,
	'roam_up': false,
	'roam_down': false,
	'roam_jump': false
}

var motion

func _init():
	motion = Vector2()

func input(event):

	if event.is_action_pressed('roam_up'):
		ie.roam_up = true
	if event.is_action_released('roam_up'):
		ie.roam_up = false
	if event.is_action_pressed('roam_down'):
		ie.roam_down = true
	if event.is_action_released('roam_down'):
		ie.roam_down = false
	if event.is_action_pressed('roam_left'):
		ie.roam_left = true
	if event.is_action_released('roam_left'):
		ie.roam_left = false
	if event.is_action_pressed('roam_right'):
		ie.roam_right = true
	if event.is_action_released('roam_right'):
		ie.roam_right = false
	if event.is_action_pressed('roam_jump'):
		ie.roam_jump = true
	if event.is_action_released('roam_jump'):
		ie.roam_jump = false

func process_walk():
	"""
	looks at variables, does stuff to the velocity
	"""
	var parent = get_parent()

	if ie.roam_left:
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	elif ie.roam_right:
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	else:
		if parent.is_on_floor():
			motion.x = lerp(motion.x, 0, 0.2)
		else:
			motion.x = lerp(motion.x, 0, 0.05)

	if ie.roam_jump:
		motion.y = -500
		ie.roam_jump = false
	parent.move_and_slide(motion, Vector2(0, -1))

func process_in_air():
	var parent = get_parent()

	if ie.roam_left:
		motion.x = max(motion.x - ACCELERATION / 1.3, -MAX_SPEED)
	elif ie.roam_right:
		motion.x = min(motion.x + ACCELERATION / 1.3, MAX_SPEED)

	motion.y = min	(motion.y + GRAVITY, TERMINAL_VELOCITY)
	parent.move_and_slide(motion, Vector2(0, -1))

func get_modes():
	var parent = get_parent()
	# da rules
	# you can walk and be in air at the same time
	# walk is the last resort default one
	var res = []
	if !parent.is_on_floor():
		res.push_back('in_air')
	else:
		res.push_back('walk')
	return res

func _physics_process(delta):
	var modes = get_modes()
	if modes.has('walk'):
		process_walk()
	if modes.has('in_air'):
		process_in_air()

