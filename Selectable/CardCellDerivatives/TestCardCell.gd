extends CardCell
class_name TestCardCell

func _init(props_):
	"""
	constructor for TestCardCell
	props_:
		...
		source: CombatEntity
	"""
	var card_data = CardData.test_card()
	for key in card_data.keys():
		props_[key] = card_data[key]

	props = props_

	props['source'] = props_.source
	props['transaction_interface'] = Global.TRANSACTION_INTERFACE

	.init(props)