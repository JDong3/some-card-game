extends Node2D

var CursorArea = load('res://CursorArea/CursorArea.gd')
var cursorArea

func make_sprite(texture_path):
	var res = Sprite.new()
	res.texture = load(texture_path)
	return res

func _init():
	var start_button = make_sprite('res://assets/sprites/start-button.png')
	var settings_button = make_sprite('res://assets/sprites/settings-button.png')
	var quit_button = make_sprite('res://assets/sprites/quit-button.png')
	var selected_sprite = make_sprite('res://assets/sprites/selected-button.png')
	var focus_interface = State.StartFocusManager.obtain_interface('start_menu_cluster')
	focus_interface.obtain_focus()
	
	var config = {
		'dimensions': Vector2(1, 3),
		'cell_size': Vector2(96, 32),
		'cells': [start_button, settings_button, quit_button],
		'selected_sprite': selected_sprite,
		'focus_interface': focus_interface
	}
	
	cursorArea = CursorArea.new(config)
	add_child(cursorArea)