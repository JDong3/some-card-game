extends Area2D

func _ready():
	var node = get_node('../Area2D')
	node.connect('area_entered', self, '_on_Area2D_area_entered')

func _on_Area2D_area_entered(area):
	print('hi')

func _process(delta):
	position.x += 30 * delta


func _on_Area2D2_area_shape_entered(area_id, area, area_shape, self_shape):
	pass # Replace with function body.
