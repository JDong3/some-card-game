extends Node
class_name FightPublisher

var subs

func _init():
	subs = {

	}

func subscribe(string, observer):
	if !subs.has(string):
		pass

func emmit(string):
	pass
