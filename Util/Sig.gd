extends Node
class_name Sig

var subs

func _init():
	subs = []

func alert(sub, props={}):
	pass

func emmit(props={}):
	for sub in subs:
		alert(sub, props)

func subscribe(listener):
	subs.push_back(listener)