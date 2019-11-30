extends Room
class_name StartRoom

func _init():
	props.events = [FightOrchestrator.new({
		'hostiles': HostileArea.new()
		})]
	.init(props)
