extends Area2D
class_name Interactable

var props = {}

var sprite
var collision_shape

var entered = false

func init(_props):
	"""
	_props:
		sprite: Sprite, what the object looks like
		collision_shape: CollisionShape
	"""
	props = _props
	sprite = props.sprite
	collision_shape = props.collision_shape
	render()

func render():

	if not sprite.get_parent() == self:
		add_child(sprite)

	if not collision_shape.get_parent() == self:
		add_child(collision_shape)




func on_entered(a, b, c, d):
	entered = true

func on_exited(a, b, c, d):
	entered = false

func interact():
	pass