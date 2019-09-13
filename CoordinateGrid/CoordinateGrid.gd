extends Node2D
class_name CoordinateGrid

var props = {}

func init(props_):
	"""
	props_:
		offset: Vector2
		space: int, gap between coordinates
	"""
	props = props_

func position_of(x, y):
	var v = props['space'] * Vector2(x, y)
	return props['offset'] + v

func draw():
	var sprite

