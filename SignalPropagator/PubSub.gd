extends Node2D
class_name PubSub

"""
pubsub with priority mode

signal emitter says

pubsub.emit_signal('xd', ...)
"""

signal change_event

var subscribers

func _init():
	subscribers = []

func has_priority(container):
	return subscribers[-1] == container

func subscribe(container):
	subscribers.push_back(container)

func unsubscribe(container):
	subscribers.erase(container)

func next(n):
	return subscribers[-(1 + n)]

