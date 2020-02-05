extends Cell
class_name StartCell

var pubsub = Global.PUB_SUB

func _init():

	props['sprite'] = CellSprite.new('res://assets/start/start-button.png')
	props['selected_sprite'] = CellSprite.new('res://assets/start/selected-button.png')
	.init(props)

func input(event):
	if event.is_action_released('cursor_select'):
		pubsub.emit('change_event', {'to': 'character_menu'})
