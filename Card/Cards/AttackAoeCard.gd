extends Card
class_name AoeAttackCard

func _init():
	props.sprite = CardSprite.new('res://assets/cards/aoe-attack.png')
	props.selected_sprite = CardSprite.new('res://assets/cards/card-outline.png')
	props.metadata = {
		'group_target': true,
		'animation': 'attack'
	}
	props.transaction = {
		'damage': 6
	}

	.init(props)
