extends Node2D
class_name StartRoomFurniture

var Tiles = load('res://Event/Rooms/StartRoomTileMap.tscn')

var props = {}

var n_portal
var s_portal
var e_portal
var w_portal
var room_node

func _init(_props):
	"""
	_props:
		room_node: RoomNode
	"""
	props = _props
	room_node = props.room_node

	setup_portals()
	add_child(Tiles.instance())

func setup_portals():
	if room_node.n:
		n_portal = DoorPortal.new({
			'to': room_node.n.uid
		})
		n_portal.position = Vector2(238, 25)
		add_child(n_portal)

	if room_node.s:
		s_portal = DoorPortal.new({
			'to': room_node.s.uid
		})
		s_portal.position = Vector2(238, 240)
		add_child(s_portal)

	if room_node.e:
		e_portal = DoorPortal.new({
			'to': room_node.e.uid
		})
		e_portal.position = Vector2(450, 120)
		add_child(e_portal)

	if room_node.w:
		w_portal = DoorPortal.new({
			'to': room_node.w.uid
		})
		w_portal.position = Vector2(20, 120)
		add_child(w_portal)
