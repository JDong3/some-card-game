extends EventContainer
class_name Horizon1

func _init():
	props.event_pool = {
		'snowy_plains_1': SnowyPlains1.new(),
		'snowy_cliffs_1': SnowyCliffs1.new()
	}
	props.entry = 'snowy_plains_1'
	.init(props)

func get_class():
	return 'Horizon1'
