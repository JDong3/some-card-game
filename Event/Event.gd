extends Node2D
class_name Event

var props = {}

var signal_propagator

func init(props_):
	props = props_

	signal_propagator = SignalPropagator.new()
	add_child(signal_propagator)
	signal_propagator.connect_signals()

	signal_propagator.connect('change_event', self, 'change_event')

func start():
	pass

func change_event(event):
	pass
