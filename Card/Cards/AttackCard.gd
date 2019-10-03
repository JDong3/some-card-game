extends Card
class_name AttackCard

func _init():
	props.sprite = CardSprite.new('res://assets/cards/test-card.png')
	props.selected_sprite = CardSprite.new('res://assets/cards/card-outline.png')
	props.transaction = {
		'damage': 4
	}
	props.metadata = {
		'single_target': true
	}

	.init(props)