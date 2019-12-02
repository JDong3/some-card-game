extends Room
class_name StartRoom

func _init():
	props.events = [Roam.new(), FightOrchestrator.new({
		'hostiles': HostileArea.new()
		})]
	.init(props)
