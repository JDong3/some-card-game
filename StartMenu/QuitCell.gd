extends Cell
class_name QuitCell

func _init():
	props['sprite'] = CellSprite.new('res://assets/start/quit-button.png')
	props['selected_sprite'] = CellSprite.new('res://assets/start/selected-button.png')
	.init(props)

func input(event):
	if event.is_action_pressed('cursor_select'):
		print('quit cell')
