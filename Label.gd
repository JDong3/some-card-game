extends Label



func _ready():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://assets/fonts/open-sans/OpenSans-Regular.ttf")
	dynamic_font.size = 12
	self["custom_fonts/font"] = dynamic_font
	
	
