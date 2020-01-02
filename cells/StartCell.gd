extends Cell
class_name StartCell


func _init():

	props['sprite'] = CellSprite.new('res://assets/start/start-button.png')
	props['selected_sprite'] = CellSprite.new('res://assets/start/selected-button.png')
	.init(props)
	add_user_signal('change_event')
	print(has_user_signal('change_event'))

func input(event):
	if event.is_action_released('cursor_select'):
		emit_signal('change_event', 'character_select')