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
	var maybe_vec = props.space * Vector2(x, y)
	return maybe_vec + props.offset

func draw():
	# marker sprite
	var marker
	var loc = props.offset

	while true:
		if loc.y > 300:
			break
		loc.x = props.offset.x

		while true:
			if loc.x > 500:
				break

			marker = PathSprite.new('res://assets/sprites/entity-selected.png')
			marker.position = loc
			add_child(marker)
			loc.x += props.space

		loc.y += props.space
