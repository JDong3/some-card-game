extends CombatEntity
class_name DogeEntity

func _init():
	props.character_sprite = CharacterSprite.new('res://assets/character/doge/')
	props.hp_bar = HpBar.new(50)

	.init(props)

func act():
	var card = DogeCard.new()
	card.props.source = self

	fight_club.hand.add_card(card)
	fight_club.fight_orchestrator.cont()