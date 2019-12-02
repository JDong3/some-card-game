extends Interactable
class_name DoorPortal

func _init(props_):
	"""
	props:
		to: String, scene path
	"""
	props = props_

	props.collision_shape = CapsuleCollision.new({
		'radius': 10
	})
	props.sprite = PathSprite.new('res://assets/sprites/entity-selected.png')
	.init(props)

