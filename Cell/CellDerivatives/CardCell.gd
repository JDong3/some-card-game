extends Cell
class_name CardCell

"""
two stages of card play, select -> play
"""

func make_props():
	return {}

func _init()(make_props()):
	pass

func input(event):
	print('implement this function', self)