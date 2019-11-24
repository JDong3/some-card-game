extends Card
class_name HealCard

func _init():
	props.sprite = CardSprite.new('res://assets/cards/heal.png')
	props.selected_sprite = CardSprite.new('res://assets/cards/card-outline.png')
	props.metadata = {
		'single_target': false,
		'animation': 'block'

	}
	props.transaction = {
		'heal': 5
	}
	.init(props)
