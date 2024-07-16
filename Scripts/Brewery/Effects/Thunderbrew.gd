class_name Thunderbrew
extends PotionEffect

var player: PlayerActor
var stop_interval: float = 10
var timer: float = 0
var speed_modifier: float = 3
var stopped: bool = false

func on_activate(_caller: Node):
	player = _caller.get_parent() as PlayerActor
	if (player):
		player.set_speed_modifier(speed_modifier)

func _update(_caller: Node, _delta: float):
	timer += _delta
	if (timer >= stop_interval):
		player.set_speed_modifier(0)
		timer = 0
		stopped = true
	elif (stopped&&timer >= 0.5):
		player.set_speed_modifier(speed_modifier)
		stopped = false
		timer = 0

func on_deactivate(_caller: Node):
	if (player):
		player.set_speed_modifier(1)
