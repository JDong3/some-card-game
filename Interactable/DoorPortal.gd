extends Interactable
class_name DoorPortal

export var to = ''
export var from = ''

var rome_club = Global.ROME_CLUB

func _init():
	"""
	props:
		to: String, uid/name of destination room,
		from: String, uid/name of current room
	"""
	#props = _props

	if to:
		pass
	elif props.has('to'):
		to = props.to
	else:
		to = ''

	if from:
		pass
	elif props.has('from'):
		from = props.from
	else:
		from = ''

	#from = props.from

	props.collision_shape = CapsuleCollision.new({
		'radius': 10
	})
	props.sprite = PathSprite.new('res://assets/sprites/portal.png')
	add_child(props.sprite)
	.init(props)

func _ready():
	return
	print('dp: ', to, ' ', from)

func interact():
	var res = {
		'to': to,
		'from': from
	}
	rome_club.last_room = from
	pubsub.emit('change_event', res)

