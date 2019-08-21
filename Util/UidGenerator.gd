extends Node
class_name UidGenerator

"""
class that guarantees generation of uid if generated using the
same instance
"""

var last_id = -1

func _init():
	"""
	empty constructor
	"""
	return

func peek():
	"""
	returns the last distributed uid
	:return: int, last distributed uid
	"""
	return last_id

func obtain_uid():
	"""
	returns a new uid
	:return: int, a new uid
	"""
	var new_id = last_id + 1
	last_id = new_id

	return new_id