extends Node2D
class_name Room

"""
this is a room

a room will have a scene that represents the room
"""

var props = {}
var events
var fight_club = Global.FIGHT_CLUB
var event_position
var current_event

func init(props):
	"""
	props:
		events:
			'entry': Event,
			'event2': Event,
			...
	"""
	var setup = GameSetup.new()
	event_position = 0

	add_child(setup)
	events = props.events

	add_child(events.entry)

	create_connections()
	events.entry.start_event()
	current_event = 'entry'

func create_connections():
	for event_key in events:
		events[event_key].connect('event_ended', self, 'change_event')

func change_event(event_name):
	print('changing events + event name ', event_name)

	remove_child(events[current_event])
	add_child(events[event_name])
	events[event_name].start_event()
