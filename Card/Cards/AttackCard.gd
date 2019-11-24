extends Card
class_name AttackCard

func _init():
	props.sprite = CardSprite.new('res://assets/cards/test-card.png')
	props.selected_sprite = CardSprite.new('res://assets/cards/card-outline.png')
	props.metadata = {
		'single_target': true,
		'animation': 'attack'
	}
	props.transaction = {
		'damage': 4
	}

	.init(props)