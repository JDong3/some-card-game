extends EventContainer
class_name RoomContainer

func _init():
	props.event_pool = {
		'entry': Roam.new()
	}
	props.entry = 'entry'

