extends Node
class_name CursorHub

var cursor_areas

func _init():
	cursor_areas = {}

func add_cursor_area(cursor_area, id):
	"""
	should only be used by the ConnectedCursorArea
	"""
	cursor_areas[id] = cursor_area

func get_cursor_area(id):
	return cursor_areas[id]