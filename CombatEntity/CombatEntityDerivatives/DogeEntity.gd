extends CombatEntity
class_name DogeEntity

func _init():
	props.character_sprite = CharacterSprite.new('res://assets/character/doge/')
	props.hp_bar = HpBar.new(50)

	.init(props)

func act():
	fight_club.hand.add_card(DogeCard.new().playable_card(self))