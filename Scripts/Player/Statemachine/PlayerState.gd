class_name PlayerState
extends State

# Typed reference to the player node.
var player: PlayerActor

func _ready() -> void:
	await owner.ready
	player = owner as PlayerActor
	assert(player != null)