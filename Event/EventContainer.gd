extends Node2D
class_name EventContainer

"""
if you children need to do autonamous swapping between each other then you
may want to make the parent an Event node

the event node has two modes 'container' and 'event', 'container' is used for
storing nodes of 'event' mode
"""

var props = {}
var event_pool
var current_event
var entry

func init(_props):
	"""
	props:
		event_pool:
			event1: Node or EventNode
			event2: Node or EventNode
			...
		entry: Str, name of the entry event
	"""
	_props = props

	event_pool = props.event_pool
	entry = props.entry
	start()

func create_connections():
	for key in event_pool:
		event_pool[key].connect('end_event', self, 'change_event')

func change_event(name):
	remove_child(event_pool[current_event])
	add_child(event_pool[name])

func start():
	"""
	trigger the signal for the event start, this function usually invoked by
	a parent Room object
	"""
	print('event pool ', event_pool)
	var event_thing = event_pool[entry]
	add_child(event_thing)
	event_thing.start()

func end_event(event_name):
	emit_signal('event_ended', event_name)