extends Node2D
class_name RoomNode

# RoomNode is a node with n, s, e, w children

var props
var n
var s
var e
var w
var event

func _init(_props={}):
	"""
	:param _props: dictionary
	_props: {
		n: RoomNode or null,
		s: RoomNode or null,
		e: RoomNode or null,
		w: RoomNode or null,
		event: Event
	}
	"""
	props = _props
