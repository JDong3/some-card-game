extends Card
class_name DogeCard

func _init():
	props.sprite = CardSprite.new('res://assets/cards/doge-card.png')
	props.selected_sprite = CardSprite.new('res://assets/cards/card-outline.png')
	props.metadata = {
		'single_target': true,
		'animation': 'attack'
	}
	props.transaction = {
		'damage': 12
	}
	.init(props)