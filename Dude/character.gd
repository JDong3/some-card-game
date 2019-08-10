extends Node2D

var defaultPosition = Vector2(100, 100);


func config(map):
	"""
	:param map: a dictionary that contains options to configure the
	character object
	"""
	if !map.has('position'):
		map['position'] = defaultPosition
		
	position = map.position