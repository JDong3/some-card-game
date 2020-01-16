extends EventContainer
class_name RoomContainer

"""
Room and Map Architecture

The RoomContainer is an EventContainer that contains Furniture and Events that
make up the flow in the room

The Furniture consists of the TileMap and the Portals (requires uid), the
Fuiniture should be given the RoomNode so that it know how it should layout it
self
"""

var furniture
var uid

func _init(_props):
	"""
		room_node: RoomNode
	"""

	props = _props
	props.event_pool = {
		'entryyy': Roam.new()
	}
	props.entry = 'entryyy'

	furniture = StartRoomFurniture.new({
		'room_node': props.room_node
	})
	add_child(furniture)

	.init(props)

func change_event(xd, force=false):
	.change_event(xd, force)

func start():
	print('room started')
	.start()
