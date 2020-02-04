extends Node2D
class_name SnowyPlains1Furniture

var Map = load('res://Floors/Horizon1/Plains1/SnowyPlains1.tscn')

var map
var to_cliffs

func _init():
	map = Map.instance()
	to_cliffs = DoorPortal.new({
		'from': 'snowy_plains_1',
		'to': 'snowy_cliffs_1'
	})
	combobulate()


func combobulate():
	to_cliffs.position = Vector2(800, 195)

	add_child(map)
	add_child(to_cliffs)

