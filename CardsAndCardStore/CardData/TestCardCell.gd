extends PlayableCard
class_name TestCardCell

func _init(props_):
	var card_data = CardData.test_card()

	props = props_

	props['source'] = props_.source
	props['transaction_interface'] = Global.TRANSACTION_INTERFACE

	.init(props)