extends Cell
class_name StartCell
	
func _init().(make_props()):
	print('sub')
	

func make_props():
	var sprite = CellSprite.new('res://assets/sprites/start-button.png')
	var selected_sprite = CellSprite.new('res://assets/sprites/selected-button.png')
	return {
		'sprite': sprite,
		'selected_sprite': selected_sprite
	}