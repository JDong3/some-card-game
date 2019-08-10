extends Node

var defaultPosition = Vector2(0, 0)

func config(map):
	if !map.has('position'):
		map['position'] = defaultPosition
	
	self.position = map['position']

func _input(event):
	
	if event.is_action_pressed("click"):
		print('clicked')