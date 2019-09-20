extends Cell
class_name PlayableCard

func init(props_):
	"""
	props:
		source+: CombatEntity
	"""
	props = props_

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