class_name MoveState
extends PlayerState

func physics_update(delta: float) -> void:
	# Falling behavior
	if not player.is_on_floor():
		state_machine.change_state("AirState")
		return

	player.direction = (Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left"))
	player.velocity.x = player.SPEED * player.direction
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	# Jump behavior
	if Input.is_action_pressed("Jump"):
		state_machine.change_state("AirState", {do_jump=true})
	
	elif is_equal_approx(player.direction, 0.0):
		state_machine.change_state("IdleState")
