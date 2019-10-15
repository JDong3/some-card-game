extends CombatEntity
class_name DudeEntity

func _init():

	props.character_sprite = CharacterSprite.new('res://assets/character/dude/')
	props.hp_bar = HpBar.new(100)
	props.focus_manager = Global.GAME_FOCUS_MANAGER

	.init(props)

func prepare():
	pass

func act():
	# hand needs to draw from draw_pile
	fight_club.hand.draw(5)

	fight_club.hand.obtain_sole_focus()
