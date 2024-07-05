class_name Liquid_Stone
extends PotionEffect

var player: PlayerActor
var visionsprite: TextureRect

func on_activate(_caller: Node):
	player = _caller.get_parent() as PlayerActor
	visionsprite = player.get_node("Camera2D/limitedvision")
	if (visionsprite):
		visionsprite.visible = true
		player.health_system.invincible = true

func _update(_caller: Node, _delta: float):
	pass
	
func on_deactivate(_caller: Node):
	if (visionsprite):
		visionsprite.visible = false
		player.health_system.invincible = false

		
