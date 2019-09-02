extends CardCell
class_name TestCardCell

func make_props():
	var res = CardData.test_card()
	return res

func _init(props_).(make_props()):
	"""
	constructor for TestCardCell
	props_:
		...
		source: CombatEntity
	"""
	props['source'] = props_.source