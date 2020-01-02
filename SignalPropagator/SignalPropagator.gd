extends Node2D
class_name SignalPropagator

"""
MUST BE THE LAST OF THE SIBLINGS TO BE ADDED, OR IT WONT KNOW HOW TO PICK UP
SIGNALS FROM THEM

maybe there can be a 'refresh' function that regets all of the appropriate
propagation candidates

on initiation will look for siblings that emmit certain signals
"""

var signal_list

func _init():
	signal_list = ['change_event']

	connect_signals()

func connect_signals():
	var siblings = get_parent().get_children()
	siblings.erase(self)

	for sibling in siblings:
		for sig in signal_list:
			if sibling.has_user_signal(sig):
				sibling.connect(sig, self, 'prop_' + sig)

func prop_change_event(event):
	"""
	event: Str, name of event as defined in the EventContainer
	"""
	emit_signal('change_event', event)