extends Node2D

var SceneInterface = load('res://SceneInterface/SceneInterface.gd')
var mapInterface

var Map = load('res://Map/Map.gd').new()

func _ready():
	mapInterface = SceneInterface.new('res://Map/Map.tscn', get_tree())

func _input(event):
	if event.is_action_released('roam_open_map'):
		mapInterface.toggle()
		return

	if event.is_action_released('dev_battle'):
		get_tree().change_scene('res://Battle/Battle.tscn')
