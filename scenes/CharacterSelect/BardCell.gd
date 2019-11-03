extends Cell
class_name BardCell

func _init():
	props['sprite'] = CellSprite.new('res://assets/sprites/bard-button.png')
	props['selected_sprite'] =CellSprite.new('res://assets/start/selected-button.png')
	.init(props)

func input(event):
	if event.is_action_released('cursor_select'):
		get_tree().change_scene('res://scenes/Rooms/TestRoom.tscn')