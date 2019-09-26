extends Cell
class_name Card

var fight_club = Global.FIGHT_CLUB

func init(props_):
	"""
	props_:
		sprite: Sprite
		SelectedSprite: Sprite
		text: String
		transaction: Dictionary
		source+: CombatEntity
		...
	"""
	props = props_

	.init(props)

func input(event):
	"""
	add the card transaction and source to the transaction_interface
	:return: null
	"""
	.input(event)

	if event.is_action_released('cursor_select'):
		fight_club.transaction_interface.add_card(self) # probably need to fix this hack
		fight_club.transaction_interface.add_source(props.source)