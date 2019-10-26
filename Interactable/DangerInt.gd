extends Interactable
class_name DangerInt

func _init():
	props.sprite = PathSprite.new('res://assets/sprites/danger-button.png')
	props.sprite.offset = Vector2(0, -13)

	props.collision_shape = CapsuleCollision.new({
		'height': 5,
		'radius': 12,
	})
	.init(props)

func _ready():
	connect("area_shape_entered", self, '_on_invaded')

func _on_invaded (a, b, c ,d):
	print('yellow')
