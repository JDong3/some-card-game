extends CursorArea
class_name EntArea

"""
cursor area but it knows how to handle different targeting modes (single target,
multiple targets (not implemented yet), group targets)
"""

var fight_club

func init(_props):
	props = _props

	fight_club = Global.FIGHT_CLUB

	.init(props)

func on_focus():
	"""
	runs whenever self is comes into focus
	"""

	# for avoiding highlighting Ents that are fainted
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
	if event.is_action_released('cursor_previous'):
		input_prev()
	render()

func input_select(event):
	"""
	handles input for the *select event
	:param event: InputEvent
	"""

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