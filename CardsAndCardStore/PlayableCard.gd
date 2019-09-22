extends Cell
class_name PlayableCard

func _init(props_):
	"""
	props:
		source: CombatEntity
	"""
	props = props_
	props.transaction_interface = Global.TRANSACTION_INTERFACE

	.init(props)

	return self

func input(event):
	"""
	add the card transaction and source to the transaction_interface
	:return: null
	"""
	if event.is_action_released('cursor_select'):
		props.transaction_interface.add_transaction(props.transaction)
		props.transaction_interface.add_source(props.source)