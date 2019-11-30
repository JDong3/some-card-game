extends Node2D
class_name Room

"""
this is a room

a room will have a scene that represents the room
"""

var props = {}
var events
var fight_club = Global.FIGHT_CLUB

func init(props):
	"""
	props:
		events: Array<Event>, list of events that make up the flow of the room
	"""
	GameSetup.new()
	print(fight_club.friendlies)
	events = props.events
	add_child(events[0])
	events[0].start_event()
