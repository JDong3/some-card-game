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

func add_friendlies(friendlies_):
	friendlies = friendlies_

func add_hostiles(hostiles_):
	hostiles = hostiles_

func add_hand(hand_):
	hand = hand_

func add_transaction_interface(transaction_interface_):
	transaction_interface = transaction_interface_
