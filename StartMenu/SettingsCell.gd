extends Cell
class_name SettingsCell

func make_props():
	var sprite = CellSprite.new('res://assets/start/settings-button.png')
	var selected_sprite = CellSprite.new('res://assets/start/selected-button.png')
	return {
		'sprite': sprite,
		'selected_sprite': selected_sprite
	}

func _init().(make_props()):
	return

func input(event):
	if event.is_action_pressed('cursor_select'):
		print('settings')