class_name PlayerActor
extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = 300.0
var direction: float = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(_delta):

	# Flip Sprite
	if direction > 0:
			animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# move_and_slide()
