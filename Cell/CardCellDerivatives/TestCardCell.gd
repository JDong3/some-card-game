extends CardCell
class_name TestCardCell

func make_props():
	var res = CardData.test_card()
	return res

func _init(props_):
	"""
	constructor for TestCardCell
	props_:
		...
		source: CombatEntity
	"""
	var card_data = CardData.test_card()
	for key in card_data.keys():
		props[key] = card_data[key]

	for key in props_.keys():
		props[key] = props_[key]

	props['source'] = props_.source

	.init(props)