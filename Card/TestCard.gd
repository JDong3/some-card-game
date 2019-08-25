extends Card
class_name TestCard

func make_props():
	var res = {
		'sprite': CardSprite.new('res://assets/cards/test-card.png')
	}
	return res

func _init().(make_props()):
	return