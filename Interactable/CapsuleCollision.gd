extends CollisionShape2D
class_name CapsuleCollision

var props = {}

var vertical
var radius
var height

func _init(_props):
	"""
	_props:
		vertical: bool=false
		radius: int
		height: int=0
	"""
	props = _props

	# set defaults
	if !props.has('height'):
		height = 0
	else:
		height = props.height

	if !props.has('vertical'):
		vertical = false
	else:
		vertical = props.vertical

	radius = props.radius
	combobulate()

func combobulate():
	shape = CapsuleShape2D.new()
	shape.height = height
	shape.radius = radius


	if !vertical:
		rotation_degrees = 90
