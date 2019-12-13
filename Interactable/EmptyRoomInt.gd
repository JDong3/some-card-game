extends Interactable
class_name EmptyRoomInt

var ta

func _init():
	props.sprite = PathSprite.new('res://assets/sprites/danger-button.png')
	props.sprite.offset = Vector2(0, -13)

	props.collision_shape = CapsuleCollision.new({
		'height': 5,
		'radius': 12,
	})
	.init(props)
	# connect('area_shape_entered', self, 'on_entered')
	# connect('area_shape_exited', self, 'on_exited')

	ta = Label.new()
	ta.text = 'abc 123'

func on_entered (a, b, c ,d):
	add_child(ta)

func on_exited(a, b, c, d):
	remove_child(ta)