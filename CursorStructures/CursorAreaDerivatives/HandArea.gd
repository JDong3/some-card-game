extends CursorArea # note: change to curtor area later
class_name Hand

var fight_club

func _init():
	fight_club = Global.FIGHT_CLUB
	props.cells = []
	props.focus_manager = Global.GAME_FOCUS_MANAGER

	.init(props)

func add_cell(cell, n):
	"""
	:param cell: the cell that you want to add to the CursorArea
	:param n: the position you want to add the cell to
	"""
	var pos_x = 0 + (48 * n)
	var pos_y = 0
	add_child(cell)
	cell.set_position(Vector2(pos_x, pos_y))

func draw(n=1):
	"""
	draws from fight_club.draw_pile
	"""
	for i in n:
		var card = fight_club.draw_pile.give()
		props.cells.push_back(card)
		add_cell(card, props.cells.size())


func input(event):

	.input(event)

	if event.is_action_released('cursor_select'):
		props.cells[cursor_position].input(event)
		props.fight_clubs.hostiles.obtain_sole_focus()