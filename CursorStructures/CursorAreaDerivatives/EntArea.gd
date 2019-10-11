extends CursorArea
class_name EntArea

"""
cursor area but it knows how to handle different targeting modes
"""

var fight_club = Global.FIGHT_CLUB

func init(props_):
	props = props_
	.init(props)

func on_focus():
	for i in range(cells.size()):
		if cells[cursor_position].is_faint:
			cursor_position = (cursor_position + 1) % cells.size()
	render()
	.on_focus()

func input(event):
	if event.is_action_released('cursor_select'):
		input_select(event)
	if event.is_action_released('combat_back'):
		input_back()
	if event.is_action_released('cursor_next'):
		input_next()
	if event.is_action_released('cursor_prev'):
		input_prev()
	render()

func input_select(event):
	# just pass the input along if its single target
	if single_target:
		cells[cursor_position].input(event)

	# pass the input along to all targets if group target
	if group_target:
		for cell in cells:
			cell.input(event)

	fight_club.transaction_interface.try_process()
	fight_club.hand.obtain_sole_focus()

func input_back():
	fight_club.hand.obtain_sole_focus()

func input_next():
	cursor_position = (cursor_position + 1) % cells.size()
	# limited range because this will crash if all ents are faint
	for i in range(cells.size()):
		if cells[cursor_position].is_faint:
			cursor_position = (cursor_position + 1) % cells.size()

func input_prev():
	cursor_position = (cursor_position - 1) % cells.size()
	# limited range because this will crash if all ents are faint
	for i in range(cells.size()):
		if cells[cursor_position].is_faint:
			cursor_position = (cursor_position - 1) % cells.size()