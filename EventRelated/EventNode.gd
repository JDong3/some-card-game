extends Node2D
class_name EventNode

"""
if you children need to do autonamous swapping between each other then you
may want to make the parent an Event node
"""

var props = {}
var event_pool
var current_event

func init(_props):
	"""
	props:
		event_pool:
			event1: EventNode
			event2: EventNode
			...
	"""
	_props = props

	if !props.has('event_pool'):
		event_pool = {}
	else:
		event_pool = props.event_pool

	if event_pool.has('entry'):
		current_event = 'entry'
		add_child(event_pool['entry'])

func create_connections():
	for key in event_pool:
		event_pool[key].connect('end_event', self, 'change_event')

func change_event(name):
	remove_child(event_pool[current_event])
	add_child(event_pool[name])

func start_event():
	"""
	trigger the signal for the event start, this function usually invoked by
	a parent Room object
	"""
	emit_signal('event_started')

func end_event(event_name):
	emit_signal('event_ended', event_name)