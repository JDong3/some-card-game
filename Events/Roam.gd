extends Event
class_name Roam

"""
an event that tiggers the *roam* phase of a room (usually the end of the seq)
"""

func _init():
	connect('event_started', self, 'start')

func start():
	var new_ent = DudeEntity.new()
	add_child(new_ent)
	new_ent.position = Vector2(100, 100)
	new_ent.obtain_sole_focus()
	new_ent.is_move = true

	add_child(DoorPortal.new({}))

func _input(event):
	if event.is_action_pressed('combat_end_turn'):
		end_event()

func end_event():
	print('event ended')
	.end_event()