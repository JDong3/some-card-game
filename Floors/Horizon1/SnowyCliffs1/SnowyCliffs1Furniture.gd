extends Node2D
class_name SnowyFliffs1Funiture

var Map = load('res://Floors/Horizon1/SnowyCliffs1/SnowyCliffs1.tscn')

var map

func _init():
	map = Map.instance()
	combobulate()

func combobulate():
	add_child(map)
