extends Area2D

func _ready():
	connect("area_shape_entered", self, '_Area2D')

func _Area2D(a, b, c ,d):
	print('yellow')
