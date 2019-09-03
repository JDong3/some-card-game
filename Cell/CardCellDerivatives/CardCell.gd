extends Cell
class_name CardCell

func init(props_):
	"""
	props:
		..CardData..
		transaction_interface: TransactionInterface
		source+: CombatEntity
	"""
	for key in props_.keys():
		props[key] = props_[key]

func input(event):
	"""
	add the card transaction and source to the transaction_interface
	:return: null
	"""
	if event.is_action_released('cursor_select'):
		props.transaction_interface.add_transaction(props.transaction)
		props.transaction_interface.add_source(props.source)
		deselect()