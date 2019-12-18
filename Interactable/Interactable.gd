extends Area2D
class_name Interactable

signal interacted

var props = {}

var collision_shape
var entered = false
var focusable
var sprite

func init(_props):
	"""
	_props:
		sprite: Sprite, what the object looks like
		collision_shape: CollisionShape
	"""
	props = _props

	sprite = props.sprite
	collision_shape = props.collision_shape
	focusable = Focusable2.new({
		'focus_manager': Global.GAME_FOCUS_MANAGER
	})
	add_child(focusable)

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
	focusable.obtain_shared_focus()
	print('hi')

func on_exited(a, b, c, d):
	entered = false
	focusable.defocus()

func interact():
	print('emitted interacted')
	emit_signal("interacted")

func input(event):
	if event.is_action_released('roam_interact'):
		interact()