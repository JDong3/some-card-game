extends Node2D
class_name FocusManager

var focusables = [] # this might not actualy be needed
var focused_on = []

# this might not actually be needed
func add_focusable(focusable):
	focusables.append(focusable)

func set_sole_focus(focusable):
	for focusable in focused_on:
		focusable.on_defocus()
	focused_on.clear()

	focusable.on_focus()
	focused_on.append(focusable)

func add_to_focus(focusable):
	for focusable in focused_on:
		focusable.on_defocus()

	focusable.on_focus()
	focused_on.append(focusable)

func has_focus(focusable):
	return focused_on.has(focusable)

func remove_focus(focusable):
	focused_on.erase(focusable)
	focusable.on_defocus()

func _input(event):
	var copy = focused_on.duplicate()
	for focusable in copy:
		focusable.input(event)