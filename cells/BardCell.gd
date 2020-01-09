extends Cell
class_name BardCell

var pubsub = Global.PUB_SUB

func _init():
	props['sprite'] = CellSprite.new('res://assets/sprites/bard-button.png')
	props['selected_sprite'] = CellSprite.new('res://assets/start/selected-button.png')
	.init(props)

func input(event):
	if event.is_action_released('cursor_select'):
		pubsub.emit_signal('change_event', 'map')