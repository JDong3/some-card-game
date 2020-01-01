extends EventNode
class_name Roam

"""
an event that tiggers the *roam* phase of a room (usually the end of the seq)
"""

func _init():
	connect('event_started', self, 'start')
	.init(props)

func start():
	var new_ent = DudeEntity.new()
	add_child(new_ent)
	new_ent.position = Vector2(100, 100)
	new_ent.obtain_sole_focus()
	new_ent.is_move = true

	var door_portal = DoorPortal.new({
		'to': 'res://Room/StartRoom.tscn'
	})
	door_portal.position = Vector2(250, 50)
	add_child(door_portal)

	var end_event_int = EndEventInt.new({
		'event': self
	})
	end_event_int.position = Vector2(250, 150)
	add_child(end_event_int)
