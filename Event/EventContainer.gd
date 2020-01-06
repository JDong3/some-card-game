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
var has_priority

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

func change_event(name):
	if !has_priority:
		return

	var event_thing = event_pool[name]

	if Global.is_event_container(event_thing):
		has_priority = false


	remove_child(event_pool[current_event])
	current_event = name
	event_thing.start()
	add_child(event_pool[name])


func start():
	"""
	trigger the signal for the event start, this function usually invoked by
	a parent Room object
	"""
	has_priority = true
	var event_thing = event_pool[entry]
	current_event = entry
	add_child(event_thing)
	event_thing.start()

func end_event(event_name):
	emit_signal('event_ended', event_name)