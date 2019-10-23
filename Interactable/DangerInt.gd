extends Interactable
class_name DangerInt

func _init():
	print(props)
	props.sprite = PathSprite.new('res://assets/sprites/danger-button.png')
	props.collision_shape = CapsuleCollision.new({
		'vertical': false,
		'height': 0,
		'radius': 16
	})
	.init(props)
