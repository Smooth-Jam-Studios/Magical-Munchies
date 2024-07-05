# Virtual base class for all states.
class_name State
extends Node

var state_machine: StateMachine = null

func enter(_msg:={}) -> void:
	pass
	
func handle_input(_event: InputEvent) -> void:
	pass

# Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
	pass

# Corresponds to the `_physics_process()` callback.
func physics_update(_delta: float) -> void:
	pass

func exit() -> void:
	pass
