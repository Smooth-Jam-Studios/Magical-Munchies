class_name PlayerActor
extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = 300#350.0
const GRAVITY = 1000.0
const FALL_GRAVITY = 1500.0
var direction: float = 0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(_delta):

	# Flip Sprite
	if direction > 0:
			animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# move_and_slide()

func get_gravity(_velocity: Vector2):
	if (_velocity.y < 0):
		return GRAVITY
	else:
		return FALL_GRAVITY
