extends EventContainer
class_name StartRoom

func _init():
	props.event_pool = {
		'entry': Roam.new(),
		'end': Roam.new(),
		'fight': Fight.new({
			'hostiles': HostileArea.new()
		})
	}
	.init(props)
