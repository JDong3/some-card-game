extends Node2D

var Map = load('res://Map/Map.tscn')
var mapOpened = false
var mapInst


func _input(event):
	if event.is_action_released('roam_open_map'):
		if !mapOpened:
			mapInst = Map.instance()
			add_child(mapInst)
			mapOpened = !mapOpened
			
		else:
			remove_child(mapInst)
			mapOpened = !mapOpened