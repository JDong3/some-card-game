extends Area2D
class_name CapsuleArea

var props
var collision_shape

func _init(_props):
	"""
	see CapsuleCollision, this literally just places an Area2D around that
	"""
	props = _props

	collision_shape = CapsuleCollision.new(_props)
	add_child(collision_shape)
	collision_shape.disabled = false
	print(collision_shape.disabled)

