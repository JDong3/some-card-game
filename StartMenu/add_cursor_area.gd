extends Node2D

var CursorArea = load('res://CursorArea/CursorArea.gd')
var Cell = load('res://CursorArea/Cell.gd')
var cursorArea

func make_sprite(texture_path):
	var res = Sprite.new()
	res.texture = load(texture_path)
	return res

func _init():

	var config = {
		'dimensions': Vector2(1, 3),
		'cell_size': Vector2(96, 32),
		'cells': [StartCell.new(), SettingsCell.new(), QuitCell.new()],
		'focus_interface': State.StartFocusManager.obtain_interface('start_menu_cluster')
	}

	cursorArea = CursorArea.new(config)
	add_child(cursorArea)