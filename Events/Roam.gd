extends Event
class_name Roam

"""
an event that tiggers the *roam* phase of a room (usually the end of the seq)
"""

func _init():
	connect('event_started', self, 'start')

func start():
	var dude = DudeEntity.new()
	dude.is_move = true
	dude.render()
	add_child(dude)