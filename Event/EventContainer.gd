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
var pubsub = Global.PUB_SUB

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
	pubsub.connect('change_event', self, 'change_event')

func change_event(name, force=false):
	event_pool[current_event].end()
	print('name: ', name, ' ', self)

	if not event_pool.has(name):
		return false
	else:
		var event_thing = event_pool[name]

		remove_child(event_pool[current_event])
		current_event = name
		event_thing.start()
		add_child(event_pool[name])
		return true

func start():
	"""
	trigger the signal for the event start, this function usually invoked by
	a parent Room object
	"""

	var event_thing = event_pool[entry]

	current_event = entry
	# print('entry: ', entry, self)
	add_child(event_thing)
	event_thing.start()
	print('gained priority: ', self)
	pubsub.subscribe(self)

func end():
	remove_child(event_pool[current_event])