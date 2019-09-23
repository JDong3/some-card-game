extends CombatEntity
class_name EdudEntity

func _init():


	props.hp_bar = HpBar.new(100)
	props.character_sprite = CharacterSprite.new('res://assets/character/edud/')

	.init(props)

func act():
	send_transaction({'damage': 4}, fight_club.friendlies.cells[0])