extends Area2D
class_name Interactable

signal interacted

var props = {}

var collision_shape
var entered = false
var focusable
var sprite
var interact_text
var pubsub

func init(_props):
	"""
	_props:
		sprite: Sprite, what the object looks like
		collision_shape: CollisionShape
	"""
	props = _props

	pubsub = Global.PUB_SUB

	sprite = props.sprite
	collision_shape = props.collision_shape
	focusable = Focusable.new({
		'focus_manager': Global.GAME_FOCUS_MANAGER
	})
	interact_text = Label.new()
	interact_text.text = 'Press E to Interact'

	add_child(focusable)

	connect('body_shape_entered', self, 'on_entered')
	connect('body_shape_exited', self, 'on_exited')
	render()

func render():

	if not sprite.get_parent() == self:
		add_child(sprite)

	if not collision_shape.get_parent() == self:
		add_child(collision_shape)

	if entered:
		focusable.obtain_shared_focus()
		add_child(interact_text)
	if !entered:
		focusable.defocus()
		if interact_text in get_children():
			remove_child(interact_text)

func on_entered(a, b, c, d):
	print('hi')
	entered = true
	render()

func on_exited(a, b, c, d):
	entered = false
	render()

func interact():
	emit_signal("interacted")

func input(event):
	if event.is_action_released('roam_interact'):
		interact()
