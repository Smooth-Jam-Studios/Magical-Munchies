class_name AirState
extends PlayerState

func enter(msg:={}) -> void:
	if msg.has("do_jump"):
		player.velocity.y = -player.JUMP_VELOCITY
	player.animated_sprite.play("Jump")

func physics_update(delta: float) -> void:
	
	player.direction = (Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left"))
	player.velocity.x = player.SPEED * player.direction
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	# Landing.
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.change_state("IdleState")
		else:
			state_machine.change_state("MoveState")