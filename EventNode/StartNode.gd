extends EventNode
class_name StartNode

var StartMenu = load('res://scenes/StartMenu/StartMenu.tscn')

var start_menu

func _init():
	props.entry = 'start_menu'
	props.event_pool = {
		start_menu: StartMenu.instance()
	}

	.init(props)