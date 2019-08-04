extends Node

const FourNode = preload('res://Floor/FourNode.gd')

"""
class that represents a BluePrint for the for the map layout algorithm to use, a BluePrint is just an object that
creates a fournode of the map, exposes makeBlueprint function
"""

func make_blueprint():
	var head
	var sec
	var third
	
	head = FourNode.new({
		n: null,
		e: null,
		s: sec,
		w: null
	});
	
	sec = FourNode.new({
		n: head,
		e: null,
		s: third,
		w: null
	});
	
	third = FourNode.new({
		n: sec,
		e: null,
		s: null,
		w: null
	})
	
	return head

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
