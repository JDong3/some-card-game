extends Node2D

var props

var n
var s
var e
var w

var n_portal
var s_portal
var e_portal
var w_portal

func init(_props):
	"""
	_props:
		n: int?, uid of room to the north
		s: int?, uid of room to the south
		e: int?
		w: int?
	"""
	props = _props

	if props.has('n'):
		n = props.n

	if props.has('s'):
		s = props.s

	if props.has('e'):
		e = props.e

	if props.has('w'):
		w = props.w

	setup_portals()

func setup_portals():
	if n:
		n_portal = DoorPortal.new({
			'to': n
		})
		n_portal.position = Vector2(150, 25)
		add_child(n_portal)

	if s:
		n_portal = DoorPortal.new({
			'to': s
		})
		n_portal.position = Vector2(150, 200)
		add_child(s_portal)

	if e:
		n_portal = DoorPortal.new({
			'to': e
		})
		n_portal.position = Vector2(400, 150)
		add_child(e_portal)

	if w:
		n_portal = DoorPortal.new({
			'to': w
		})
		n_portal.position = Vector2(50, 150)
		add_child(w_portal)