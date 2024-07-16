class_name MoveState
extends PlayerState

func enter(_msg:={}) -> void:
	player.animated_sprite.play("Run")

func physics_update(_delta: float) -> void:
	# Falling behavior
	if not player.is_on_floor():
		state_machine.change_state("AirState")
		return

	player.direction = (Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left"))
	player.velocity.x = player.SPEED * player.speed_modifier * player.direction * player.get_direction_modifier()
	player.move_and_slide()

	# Jump behavior
	if Input.is_action_pressed("Jump"):
		state_machine.change_state("AirState", {do_jump=true})
	
	elif is_equal_approx(player.direction, 0.0):
		state_machine.change_state("IdleState")
