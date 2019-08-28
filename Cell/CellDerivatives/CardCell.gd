extends Cell
class_name CardCell

"""
two stages of card play, select -> play
"""

func _init(props_).(props_):
	"""
	props:
		..: ..
		transaction_interface: a

	"""
	props = props_

func input(event):
	print('implement this function', self)