extends Cell
class_name CardCell

func _init(props_).(props_):
	"""
	props:
		...
		transaction_interface: TransactionInterface
		transaction: Dictionary
		source+: CombatEntity
	"""
	props = props_

func input(event):
	if !props.has('source'):
		print('add a source ', self)
