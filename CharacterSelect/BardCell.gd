extends Cell
class_name BardCell

func make_props():
	var sprite = CellSprite.new('res://assets/sprites/bard-button.png')
	var selected_sprite = CellSprite.new('res://assets/start/selected-button.png')
	return {
		'sprite': sprite,
		'selected_sprite': selected_sprite
	}

func _init().(make_props()):
	return

func input(event):
	if event.is_action_released('cursor_select'):
		get_tree().change_scene('res://GameView/GameView.tscn')