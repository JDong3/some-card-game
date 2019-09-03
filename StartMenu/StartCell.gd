extends Cell
class_name StartCell

func _init():
	props['sprite'] = CellSprite.new('res://assets/start/start-button.png')
	props['selected_sprite'] = CellSprite.new('res://assets/start/selected-button.png')
	.init(props)

func input(event):
	if event.is_action_released('cursor_select'):
		return get_tree().change_scene('res://CharacterSelect/CharacterSelect.tscn')