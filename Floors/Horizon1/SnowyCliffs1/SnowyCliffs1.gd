extends EventContainer
class_name SnowyCliffs1

func _init():
	props.event_pool = {
		'roam': Roam.new()
	}
	props.entry = 'roam'
	props.furniture = 1
	.init(props)
