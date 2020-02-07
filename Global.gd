extends Node

var GAME_FOCUS_MANAGER = FocusManager.new()

var FIGHT_CLUB = FightClub.new()
var ROME_CLUB = RomeClub.new()
var PUB_SUB = PubSub.new()

func is_event_container(obj):
	return obj is EventContainer
