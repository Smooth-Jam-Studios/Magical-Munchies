class_name PlayerActor
extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = 400 # 350.0
const GRAVITY = 1000.0
const FALL_GRAVITY = 1500.0
var direction: float = 0

var speed_modifier: float = 1.0
var jump_modifier: float = 1.0

@onready var animated_sprite = $AnimatedSprite2D
@export var inv: Inv

func _physics_process(_delta):

	# Flip Sprite
	if direction > 0:
			animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# move_and_slide()
func collect(item):
	inv.Insert(item)

func get_gravity(_velocity: Vector2):
	if (_velocity.y < 0):
		return GRAVITY
	else:
		return FALL_GRAVITY

func set_speed_modifier(modifier: float):
	# Cheap way to prvent moving
	# if modifier < 0.2:
	# 	modifier = 0.2
	speed_modifier = modifier

func set_jump_modifier(modifier: float):
	# Cheap way to prvent jumping
	# if modifier < 0.2:
	# 	modifier = 0.2
	jump_modifier = modifier