extends Node2D
class_name Event

"""
a room has many events

an event has a start and a finish and will signal those events
"""

signal event_started
signal event_ended

var props = {}
var fight_club = Global.FIGHT_CLUB

func init(props_):
	props = props_

func start_event():
	"""
	trigger the signal for the event start, this function usually invoked by
	a parent Room object
	"""
	emit_signal('event_started')

func end_event():
	print('end emitted')
	emit_signal('event_ended')