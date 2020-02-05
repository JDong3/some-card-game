extends Node2D
class_name PubSub

"""
pubsub with priority mode

signal emitter says

pubsub.emit_signal('xd', ...)
"""

signal change_event
"""
props:
	to: String
	from: String
"""

var subscribers

func _init():
	subscribers = []
	connect('change_event', self, 'monitor')

func has_priority(container):
	var temp = subscribers.duplicate()
	return temp[0] == container

func subscribe(container):
	subscribers.push_front(container)

func unsubscribe(container):
	subscribers.erase(container)

func next(n):
	return subscribers[-(1 + n)]

func emit(sig_name, args=[]):

	if not args is Array:
		args = [args]

	for sub in subscribers:
		if sub.callv(sig_name, args):
			break

func monitor(xd):
	print(xd)

