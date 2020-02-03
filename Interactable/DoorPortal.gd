extends Interactable
class_name DoorPortal

var to

func _init(_props):
	"""
	props:
		to: String, uid/name of destination room,
		from: String, uid/name of current room
	"""
	props = _props

	to = props.to

	props.collision_shape = CapsuleCollision.new({
		'radius': 10
	})
	props.sprite = PathSprite.new('res://assets/sprites/portal.png')
	.init(props)

func interact():
	pubsub.emit('change_event', [to])
