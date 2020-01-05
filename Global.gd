extends Node

var GAME_FOCUS_MANAGER = FocusManager.new()

var FIGHT_CLUB = FightClub.new()
var PUB_SUB = PubSub.new()

func is_event_container(obj):
	return obj is EventContainer