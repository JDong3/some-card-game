extends EventContainer
class_name MapContainer

"""
container with many rooms (EventContainers), need to take in a graph and know
how to create room that connect to each other
"""

var map

func _init(_props):
	"""
	_props:
		map: RoomNode
	"""
	props = _props
	map = props.map
	# take the map and create an appropriate event pool
