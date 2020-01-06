extends Interactable
class_name DoorPortal

func _init(_props):
	"""
	props:
		to: String, uid of room
	"""
	props = _props

	props.collision_shape = CapsuleCollision.new({
		'radius': 10
	})
	props.sprite = PathSprite.new('res://assets/sprites/portal.png')
	.init(props)

func interact():
	get_tree().change_scene(props.to)
