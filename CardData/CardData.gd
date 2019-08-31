extends Node
class_name CardData

static func test_card():
	return {
		'sprite': CardSprite.new('res://assets/cards/test-card.png'),
		'selected_sprite': CardSprite.new('res://assets/cards/card-outline.png'),
		'transaction': {
			'damage': 4
		}

		# 'text': 'deals 4 damage' # note: may need text later for description and stuff
	}