extends Interactable
class_name DangerInt

func _init():
	print(props)
	props.sprite = PathSprite.new('res://assets/sprites/danger-button.png')
	props.collision_shape = CollisionShape2D.new()

	var shape = CapsuleShape2D.new()
	shape.height = 0
	shape.radius = 11
	props.collision_shape.shape = shape


	.init(props)