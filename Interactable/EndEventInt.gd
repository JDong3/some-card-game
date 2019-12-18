extends Interactable
class_name EndEventInt

func _init():
	props.sprite = PathSprite.new('res://assets/sprites/danger-button.png')
	props.sprite.offset = Vector2(0, -13)

	props.collision_shape = CapsuleCollision.new({
		'height': 5,
		'radius': 12,
	})
