extends Interactable
class_name DoorPortal

export var to = ''
export var from = ''

func _init():
	"""
	props:
		to: String, uid/name of destination room,
		from: String, uid/name of current room
	"""
	#props = _props
	print('dp: ', to, ' ', from)


	if to:
		pass
	elif !props.has('to'):
		to = ''
	else:
		to = props.to

	#from = props.from

	props.collision_shape = CapsuleCollision.new({
		'radius': 10
	})
	props.sprite = PathSprite.new('res://assets/sprites/portal.png')
	add_child(props.sprite)
	.init(props)

func interact():
	var res = {
		'to': to,
		'from': from
	}
	pubsub.emit('change_event', res)

func _process(delta):
	print(to)
