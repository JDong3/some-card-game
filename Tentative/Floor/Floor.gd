extends Node2D

const FourNode = preload('res://Floor/FourNode.gd')

func _ready():
	var n0 = FourNode.new({
		n: null
		e: null
		s: null
		w: null
	})
