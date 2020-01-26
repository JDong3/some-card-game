extends EventContainer
class_name MapContainer

"""
container with many rooms (EventContainers), need to take in a graph and know
how to create room that connect to each other
"""

var map
var uid_generator
var blueprint

func _init(_props):
	"""
	_props:
		blueprint: BluePrint
	"""
	props = _props

	blueprint = props.blueprint

	uid_generator = UidGenerator.new()

	props.event_pool = build_event_pool()

	build_event_pool()
	.init(props)

func build_event_pool():
	"""
	run before parents init, assigns the different rooms an id
	"""
	var res = {}
	var nodes = blueprint.get_nodes()

	props.entry = 0

	for node in nodes:
		var event = RoomContainer.new({
			'room_node': node
		})
		res[node.uid] = event

	return res

func start():
	.start()