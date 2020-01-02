extends EventContainer
class_name MainContainer

var StartMenu = load('res://scenes/StartMenu/StartMenu.tscn')

var start_menu

func _init():

	add_child(Global.GAME_FOCUS_MANAGER)
	add_child(Global.START_FOCUS_MANAGER)
	props.entry = 'start_menu'
	props.event_pool = {
		'start_menu': StartMenuEvent.new(),
		'character_menu': CharacterSelectEvent.new()
	}

	.init(props)