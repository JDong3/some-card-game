extends Node2D

var SceneInterface = load('res://SceneInterface/SceneInterface.gd')
var mapInterface

func _ready():
	mapInterface = SceneInterface.new('res://Map/Map.tscn', get_tree())

func _input(event):
	if event.is_action_released('roam_open_map'):
		mapInterface.toggle()

		