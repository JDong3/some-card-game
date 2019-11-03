extends Area2D

func _ready():
	connect("area_shape_entered", self, '_on_Area2D_area_shape_entered')


func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	print('yellow')
