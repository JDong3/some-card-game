extends Node
class_name FightClub

"""
every member of the FightClub should have a refernece to every other member of
the FightClub
"""

var friendlies
var hostiles
var hand
var transaction_interface

func _init():
	pass

func add_friendlies(friendlies_):
	friendlies = friendlies_
