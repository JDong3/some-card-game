extends Node2D

var CursorArea = load('res://CursorArea/CursorArea.gd')
var cursorArea



func _init():
	var startButton1 = Sprite.new()
	var startButton2 = Sprite.new()
	
	startButton1.texture = load('res://assets/sprites/start-button.png')
	startButton2.texture = load('res://assets/sprites/start-button.png')
	
	var config = {
		'dimensions': Vector2(1, 2),
		'cell_size': Vector2(96, 32),
		'cells': [startButton1, startButton2]
	}
	
	
	cursorArea = CursorArea.new(config)
	add_child(cursorArea)