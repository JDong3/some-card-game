extends CursorArea
class_name EntArea

"""
cursor area but it knows how to handle different targeting modes
"""

var fight_club = Global.FIGHT_CLUB

func init(props_):
	props = props_
	.init(props)

func input(event):

	if event.is_action_released('cursor_select'):
		# just pass the input along if its single target
		if single_target:
			cells[cursor_position].input(event)

		# pass the input along to all targets if group target
		if group_target:
			for cell in cells:
				cell.input(event)

		fight_club.transaction_interface.try_process()
		fight_club.hand.obtain_sole_focus()
	if event.is_action_released('combat_back'):
		fight_club.hand.obtain_sole_focus()


	.input(event)
