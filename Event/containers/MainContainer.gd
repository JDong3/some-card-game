extends EventContainer
class_name MainContainer

var start_menu
var pubsub = Global.PUB_SUB

func _init():

	add_child(Global.GAME_FOCUS_MANAGER)
	props.entry = 'start_menu'
	props.event_pool = {
		'start_menu': StartMenuEvent.new(),
		'character_menu': CharacterSelectEvent.new(),
		'game': GameContainer.new()
	}
	add_child(pubsub)
	pubsub.connect('change_event', self, 'change_event')

	.init(props)
	start()

	var xd = BluePrint.new()
	print(xd.get_nodes())

func change_event(xd):
	.change_event(xd)