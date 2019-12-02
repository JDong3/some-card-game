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

func init(props):
	"""
	props:
		events: Array<Event>, list of events that make up the flow of the room
	"""
	var setup = GameSetup.new()
	event_position = 0

	add_child(setup)
	print(fight_club.friendlies)
	events = props.events
	add_child(events[event_position])

	create_connections()
	events[event_position].start_event()

func create_connections():
	for event in events:
		event.connect('event_ended', self, 'change_event')

func change_event():
	print('changing events')

	remove_child(events[event_position])

	event_position += 1
	add_child(events[event_position])
	events[event_position].start_event()
