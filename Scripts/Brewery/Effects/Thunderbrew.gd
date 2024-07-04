class_name Thunderbrew
extends PotionEffect

var player: PlayerActor

func on_activate(_caller: Node):
    player = _caller.get_parent() as PlayerActor
    if (player):
        player.set_speed_modifier(2)

func on_deactivate(_caller: Node):
    if (player):
        player.set_speed_modifier(1)
