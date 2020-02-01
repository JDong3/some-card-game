extends Ent
class_name DudeEntity

func _init():

	props.character_sprite = CharacterSprite.new({
		'path': 'res://assets/character/dude/',
		'offset': Vector2(0, -16)
	})

	props.area = CapsuleCollision.new({
		'radius': 10,
		'height': 15,
		'vertical': true
	})
	props.hp_bar = HpBar.new(100)
	props.focus_manager = Global.GAME_FOCUS_MANAGER

	.init(props)

func prepare():
	pass

func act():
	# hand needs to draw from draw_pile
	fight_club.hand.draw(5)

	fight_club.hand.obtain_sole_focus()
