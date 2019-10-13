extends CombatEntity
class_name EdudEntity

func _init():

	props.hp_bar = HpBar.new(1)
	props.character_sprite = CharacterSprite.new('res://assets/character/edud/')

	.init(props)

func act():
	fight_club.friendlies.cells[0].process_transaction({'damage': 4}, self)
	fight_club.fight_orchestrator.cont()