extends Node2D
class_name SnowyPlains1Furniture

var Map = load('res://Floors/SnowyFloor1/SnowyPlains1.tscn')

var map
var to_cliffs

func _init():
	map = Map.instance()
	to_cliffs = DoorPortal.new({
		from: 'snowy_plains_1',
		to: 'snowy_cliffs_1'
	})


func combobulate():
	add_child(map)
	add_child(to_cliffs)

