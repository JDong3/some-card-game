extends Cell
class_name CardCell

"""
two stages of card play, select -> play
"""

func _init(props_).(props_):
	"""
	props:
		..: ..
		transaction_interface: TransactionInterface
		transaction: Dictionary
		source..: CombatEntity
	"""
	props = props_

func input(event):
	if !props.has('source'):
		print('add a source ', self)

