extends Card
class_name AoeHealCard

func _init():
	props.sprite = CardSprite.new('res://assets/cards/aoe-heal.png')
	props.selected_sprite = CardSprite.new('res://assets/cards/card-outline.png')
	props.metadata = {
		'group_target': true
	}
	props.transaction = {
		'heal': 5
	}
	.init(props)

