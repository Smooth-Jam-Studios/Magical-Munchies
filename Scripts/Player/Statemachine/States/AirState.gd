class_name AirState
extends PlayerState

@export var use_variable_jump: bool = false

func enter(msg:={}) -> void:
	if msg.has("do_jump"):
		player.velocity.y = -player.JUMP_VELOCITY
		EventBus.play_sound("PlayerJump")
		player.animated_sprite.play("Jump")

func physics_update(delta: float) -> void:
	# Horizontal
	player.direction = (Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left"))
	player.velocity.x = player.SPEED * player.direction

	# Vertical
	player.velocity.y += player.get_gravity(player.velocity) * delta
	# Allow variable jump height based on input duration.
	if Input.is_action_just_released("Jump") and player.velocity.y < 0.0:
		if use_variable_jump:
			player.velocity.y = player.JUMP_VELOCITY / 4.0
		
	
	# Apply movement
	player.move_and_slide()

	# Landing.
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.change_state("IdleState")
		else:
			state_machine.change_state("MoveState")