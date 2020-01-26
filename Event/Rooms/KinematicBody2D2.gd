extends KinematicBody2D


func _physics_process(delta):

	var parent = get_parent()
	var motion = Vector2()
	motion.x = 0

	var GRAVITY = Vector2(0, 100)

	motion += GRAVITY
	move_and_slide(motion, Vector2(0, -1))