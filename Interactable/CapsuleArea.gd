extends Area2D
class_name CapsuleArea

var props

func _init(_props):
	"""
	see CapsuleCollision, this literally just places an Area2D around that
	"""
	props = _props
	add_child(CapsuleCollision.new(_props))

