extends Node2D
class_name SceneManager

var StartMenu = load('res://scenes/StartMenu/StartMenu.tscn')

var start_menu

func _init():
	pass

func _ready():
	# start with the game menu
	game()

func game():
	start_menu = StartMenu.instance()
	add_child(start_menu)