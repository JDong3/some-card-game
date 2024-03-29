extends CombatEntity
class_name EdudEntity

func _init():

	props.hp_bar = HpBar.new(20)
	props.character_sprite = CharacterSprite.new({
		'path': 'res://assets/character/dude/',
		'offset': Vector2(0, -30),
		'flip_h': true
		})

	.init(props)

func act():
	fight_club.friendlies.cells[0].process_transaction({'damage': 4}, self)
	fight_club.fight_orchestrator.cont()