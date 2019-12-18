extends Event
class_name Roam

"""
an event that tiggers the *roam* phase of a room (usually the end of the seq)
"""

func _init():
	connect('event_started', self, 'start')

func start():
	print('roam stared')

	var new_ent = DudeEntity.new()
	add_child(new_ent)
	new_ent.position = Vector2(100, 100)
	new_ent.obtain_sole_focus()
	new_ent.is_move = true

	var door_portal = DoorPortal.new({
		'to': 'res://Room/StartRoom.tscn'
	})
	door_portal.position = Vector2(150, 150)
	add_child(door_portal)

	var end_event_int = EndEventInt.new()
	end_event_int.position = Vector2(120, 120)
	add_child(end_event_int)

func _input(event):
	if event.is_action_pressed('combat_end_turn'):
		return
		end_event()

func end_event():
	print('event ended')
	.end_event()