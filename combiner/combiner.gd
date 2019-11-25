extends CursorArea
class_name Combiner

func _init():
	pass

func attach_cell(cell):
	var n = cells.find
	var pos = Vector2(n*30, 0)
	cell.position = pos
	add_child(cell)

