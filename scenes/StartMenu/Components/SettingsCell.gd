extends Cell
class_name SettingsCell

func _init():
	props['sprite'] = CellSprite.new('res://assets/start/settings-button.png')
	props['selected_sprite'] = CellSprite.new('res://assets/start/selected-button.png')
	.init(props)

func input(event):
	if event.is_action_pressed('cursor_select'):
		pass