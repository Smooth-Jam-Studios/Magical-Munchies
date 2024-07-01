class_name StateMachine
extends Node

signal changed_state(parent_name, state_name)

@export var initial_state := NodePath()

# The current active state. At the start of the game, we get the `initial_state`.
@onready var state: State = get_node(initial_state)

func _ready() -> void:
	
	await owner.ready
	# The state machine assigns itself to the State objects' state_machine property.
	for child in get_children():
		child.state_machine = self
	state.enter()

# The state machine subscribes to node callbacks and delegates them to the state objects.
func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)

func _process(delta: float) -> void:
	state.update(delta)

func _physics_process(delta: float) -> void:
	state.physics_update(delta)

func change_state(target_state_name: String, msg: Dictionary={}) -> void:
	if not has_node(target_state_name):
		printerr("State not found: ", target_state_name)
		return

	state.exit()
	state = get_node(target_state_name)
	state.enter(msg)
	emit_signal("changed_state", owner.name, state.name)
