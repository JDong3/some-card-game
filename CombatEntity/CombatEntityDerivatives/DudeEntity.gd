extends Ent
class_name DudeEntity

func _init():

	collision_mask = 1 + 2
	props.character_sprite = CharacterSprite.new({
		'path': 'res://assets/character/dude/',
		'offset': Vector2(0, 1)
	})

	props.area = CapsuleCollision.new({
		'radius': 10,
		'height': 15,
		'vertical': true
	})
	props.hp_bar = HpBar.new(100)
	props.focus_manager = Global.GAME_FOCUS_MANAGER

	# camera stuff
	var camera
	camera = Camera2D.new()
	add_child(camera)
	camera.current = true

	.init(props)

func prepare():
	pass

func act():
	# hand needs to draw from draw_pile
	fight_club.hand.draw(5)

	fight_club.hand.obtain_sole_focus()
