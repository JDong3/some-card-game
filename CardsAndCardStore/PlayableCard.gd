extends Cell
class_name PlayableCard

var fight_club

func _init(props_):
	"""
	props:
		source: CombatEntity
	"""
	props = props_
	fight_club = Global.FIGHT_CLUB

	.init(props)

	return self

func input(event):
	"""
	add the card transaction and source to the transaction_interface
	:return: null
	"""
	if event.is_action_released('cursor_select'):
		fight_club.transaction_interface.add_transaction(props.transaction)
		fight_club.transaction_interface.add_source(props.source)