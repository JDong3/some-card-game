extends Event
class_name Roam

"""
an event that tiggers the *roam* phase of a room (usually the end of the seq)
"""

var new_ent
var door_portal
var end_event_int

func _init():
	.init(props)

func start():
	new_ent = DudeEntity.new()
	add_child(new_ent)
	new_ent.position = Vector2(100, 100)
	new_ent.obtain_sole_focus()
	new_ent.is_move = true

	end_event_int = EndEventInt.new({
		'event': self
	})
	end_event_int.position = Vector2(250, 150)
	# add_child(end_event_int)

func end():
	if new_ent in get_children():
		remove_child(new_ent)
	if end_event_int in get_children():
		remove_child(end_event_int)