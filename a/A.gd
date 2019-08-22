extends Node2D

func _ready():
	var config = {
		'sprite': CardSprite.new('res://assets/cards/test-card.png')
	}
	var card = Card.new(config)
	card.combobulate()
	card.set_position(Vector2(100, 100))
	add_child(card)
