extends Node2D
class_name SnowyCliffs1Funiture

var Map = load('res://Floors/Horizon1/SnowyCliffs1/SnowyCliffs1.tscn')

var map
var to_plains

func _init():
	map = Map.instance()
	#to_plains = DoorPortal.new({
	#	'from': 'snowy_cliffs_1',
	#	'to': 'snowy_plains_1'
	#})
	combobulate()

func combobulate():
	add_child(map)

	# to_plains.position = Vector2(50, 200)
	add_child(to_plains)


func get_portals():
	var children = map.get_children()
	var portals = []

	for child in children:
		if child is DoorPortal:
			portals.push_back(child)

	return portals
