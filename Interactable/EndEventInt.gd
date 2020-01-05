extends Interactable
class_name EndEventInt

var event
var pubsub = Global.PUB_SUB

func _init(_props):
	"""
	props:
		event: Event, the event that this inter will end when interacted with
	"""
	props = _props

	event = props.event

	props.sprite = PathSprite.new('res://assets/sprites/danger-button.png')
	props.sprite.offset = Vector2(0, -13)

	props.collision_shape = CapsuleCollision.new({
		'height': 5,
		'radius': 12,
	})
	.init(props)

func interact():
	pubsub.emit_signal('change_event', 'fight')