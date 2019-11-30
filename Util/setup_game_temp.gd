extends Node2D
class_name GameSetup

func _init():
	# FightOrchestrator design incubator
	add_child(Global.GAME_FOCUS_MANAGER)

	# in fight club
	var friendlies = FriendlyArea.new()
	friendlies.position = Vector2(150, 150)
	Global.FIGHT_CLUB.friendlies = friendlies

	# in fight club, need a deck that is filled
	var deck = AttackFocusDeck.new()
	Global.FIGHT_CLUB.deck = deck
