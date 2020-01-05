extends EventContainer
class_name GameContainer

func _init():
	props.event_pool = {
		'entry': Roam.new(),
		#'end': Roam.new(),
		#'fight': Fight.new({
		#	'hostiles': HostileArea.new()
		#})
	}

	props.entry = 'entry'
	.init(props)
