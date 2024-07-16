class_name Draught_of_Ascendance
extends PotionEffect

var player: PlayerActor
var stop_interval: float = 10
var timer: float = 0
var speed_modifier: float = 3
var stopped: bool = false

func on_activate(_caller: Node):
	player = _caller.get_parent() as PlayerActor
	if (player):
		player.set_jump_modifier(2)
		player.set_direction_modifier(true)

func _update(_caller: Node, _delta: float):
	pass

func on_deactivate(_caller: Node):
	if (player):
			player.set_jump_modifier(1)
			player.set_direction_modifier(false)
