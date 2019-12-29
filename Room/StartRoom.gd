extends Room
class_name StartRoom

func _init():
	props.events = {
		'entry': Roam.new(),
		'end': Roam.new(),
		'fight': Fight.new({
			'hostiles': HostileArea.new()
		})
	}
	.init(props)
