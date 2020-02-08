extends Node2D
class_name SnowyPlains1Furniture

var Map = load('res://Floors/Horizon1/SnowyPlains1/SnowyPlains1.tscn')

var map

func _init():
	map = Map.instance()
	combobulate()


func combobulate():
	add_child(map)

func get_portals():
	var children = map.get_children()
	var portals = []

	for child in children:
		if child is DoorPortal:
			portals.push_back(child)

	return portals

