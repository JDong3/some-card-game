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
	if force:
		print('native', name)
	if not pubsub.has_priority(self) and not force:
		return

	if not event_pool.has(name):
		#print('no: ', name)
		var self_index = pubsub.subscribers.find(self)
		var candidate = pubsub.subscribers[self_index - 1]

		if candidate == pubsub.subscribers[-1]:
			return

		candidate.change_event(name, true)
	else:
		#print('yes: ', name)
		var event_thing = event_pool[name]

		remove_child(event_pool[current_event])
		current_event = name
		event_thing.start()
		add_child(event_pool[name])
	#print('completed: ', name)


func start():
	"""
	trigger the signal for the event start, this function usually invoked by
	a parent Room object
	"""
	pubsub.subscribe(self)
	var event_thing = event_pool[entry]

	current_event = entry
	print('entry: ', entry, self)
	add_child(event_thing)
	event_thing.start()

func end_event(event_name):
	emit_signal('event_ended', event_name)