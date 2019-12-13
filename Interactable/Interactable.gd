extends Focusable
class_name Interactable

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
	connect('area_shape_entered', self, 'on_entered')
	connect('area_shape_exited', self, 'on_exited')
	render()

func render():

	if not sprite.get_parent() == self:
		add_child(sprite)

	if not collision_shape.get_parent() == self:
		add_child(collision_shape)

func on_entered(a, b, c, d):
	entered = true
	print('hi')

func on_exited(a, b, c, d):
	entered = false

func interact():
	pass