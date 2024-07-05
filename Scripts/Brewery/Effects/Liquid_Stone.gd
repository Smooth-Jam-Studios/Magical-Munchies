class_name Liquid_Stone
extends PotionEffect

var player: PlayerActor
var visionsprite: TextureRect

func on_activate(_caller: Node) -> void:
	
	player = _caller.get_parent() as PlayerActor
	visionsprite = player.get_node("Camera2D/limitedvision")
	
func _update(_caller: Node, _delta: float) -> void:
	if (visionsprite&&player):
		visionsprite.visible = true
		player.health_system.invincible = true

	
func on_deactivate(_caller: Node) -> void:
	if (visionsprite):
		visionsprite.visible = false
		player.health_system.invincible = false
