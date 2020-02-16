extends EventContainer
class_name MainContainer

var start_menu
var rome_club = Global.ROME_CLUB

func _init():
	add_child(Global.GAME_FOCUS_MANAGER)
	props.entry = 'start_menu'
	props.event_pool = {
		'start_menu': StartMenuEvent.new(),
		'character_menu': CharacterSelectEvent.new(),
		'map': Horizon1.new()
	}
	add_child(pubsub)

	rome_club.dude = DudeEntity.new()

	.init(props)
	start()
