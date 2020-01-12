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
	print('name: ', name, ' force: ', force, ' subs: ', pubsub.subscribers.size(), pubsub.subscribers, self)
	print('event_pool: ', event_pool)
	if not pubsub.has_priority(self) and not force:
		print('get outta here')
		return

	if not event_pool.has(name):
		print("nonono")
		var self_index = pubsub.subscribers.find(self)
		if self_index == 0:
			return
		var candidate = pubsub.subscribers[self_index - 1]


		candidate.change_event(name, true)
	else:
		print("yesyesyes")
		var event_thing = event_pool[name]

		remove_child(event_pool[current_event])
		current_event = name
		event_thing.start()
		add_child(event_pool[name])


func start():
	"""
	trigger the signal for the event start, this function usually invoked by
	a parent Room object
	"""
	pubsub.subscribe(self)
	print(event_pool)
	print(entry)
	var event_thing = event_pool[entry]

	current_event = entry
	add_child(event_thing)
	event_thing.start()

func end_event(event_name):
	emit_signal('event_ended', event_name)