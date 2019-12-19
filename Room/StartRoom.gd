extends Room
class_name StartRoom

func _init():
	props.events = [Roam.new(), Fight.new({
		'hostiles': HostileArea.new()
		})]
	.init(props)
