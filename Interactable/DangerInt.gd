extends Interactable
class_name DangerInt

func _init():
	print(props)
	props.sprite = PathSprite.new('res://assets/sprites/danger-button.png')
	props.collision_shape = null
	.init(props)