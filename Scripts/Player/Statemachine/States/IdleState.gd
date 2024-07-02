class_name IdleState
extends PlayerState

func enter(_msg:={}) -> void:
	# Ensure the character stops moving
	player.velocity = Vector2.ZERO
	player.direction = 0
	player.animated_sprite.play("Idle")

func physics_update(_delta: float) -> void:
	player.move_and_slide() # Needs to be here to allow movement on e.g. platforms. Possibly move to PlayerActor.gd
	# Falling behavior
	if not player.is_on_floor():
		state_machine.change_state("AirState")
		return

	# Jump behavior
	if Input.is_action_pressed("Jump"):
		state_machine.change_state("AirState", {do_jump=true})
	
	# Move behavior
	elif Input.is_action_pressed("Move_Left") or Input.is_action_pressed("Move_Right"):
		state_machine.change_state("MoveState")
