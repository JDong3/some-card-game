extends CursorArea
class_name Combiner

func _init():
	.init({
		'cells': []
	})

func add_card(card):
	cells.push_back(card)
	print(cells)
	.render()

func attach_cell(cell):
	var n = cells.find(cell)
	var pos = Vector2(n*30, 0)
	cell.position = pos
	add_child(cell)
