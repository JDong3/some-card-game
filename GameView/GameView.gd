extends Node2D

var SceneInterface = load('res://SceneInterface/SceneInterface.gd')
var mapInterface

var Map = load('res://Map/Map.gd').new()

var Dude = load('res://Dude/Dude.tscn')
var dude = Dude.instance()

func _ready():
	mapInterface = SceneInterface.new('res://Map/Map.tscn', get_tree())
	dude.config({'position': Vector2(150, 150)})
	self.add_child(dude)

func _input(event):

	if event.is_action_released('roam_open_map'):
		mapInterface.toggle()
		return