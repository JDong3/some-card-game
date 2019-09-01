extends Cell
class_name StartCell

func make_props():
	var sprite = CellSprite.new('res://assets/start/start-button.png')
	var selected_sprite = CellSprite.new('res://assets/start/selected-button.png')
	return {
		'sprite': sprite,
		'selected_sprite': selected_sprite
	}

func _init().(make_props()):
	return

func input(event):
	if event.is_action_released('cursor_select'):
		return get_tree().change_scene('res://CharacterSelect/CharacterSelect.tscn')