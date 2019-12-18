extends Node2D
class_name GameSetup

func _init():
	print('setting up')
	# FightOrchestrator design incubator
	if Global.GAME_FOCUS_MANAGER.get_parent() != null:
		Global.GAME_FOCUS_MANAGER.get_parent().remove_child(Global.GAME_FOCUS_MANAGER)
	add_child(Global.GAME_FOCUS_MANAGER)

	print('focused on ', Global.GAME_FOCUS_MANAGER.focused_on)
	# in fight club
	var friendlies = FriendlyArea.new()
	friendlies.position = Vector2(150, 150)
	Global.FIGHT_CLUB.friendlies = friendlies

	# in fight club, need a deck that is filled
	var deck = AttackFocusDeck.new()
	Global.FIGHT_CLUB.deck = deck
