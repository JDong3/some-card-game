extends Area2D
class_name Interactable

var sprite
var collisionShape
var props = {}

func init(_props):
	"""
	_props:
		sprite: Sprite, what the object looks like
		collision_shape: CollisionShape
	"""
	props = _props
	sprite = props.sprite
	collisionShape = props.collision_shape
	render()

func render():
	add_child(sprite)
	add_child(collision_shape)
	pass