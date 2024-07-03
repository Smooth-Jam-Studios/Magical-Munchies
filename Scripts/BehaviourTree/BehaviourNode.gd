class_name BehaviourNode
extends Node

enum NodeState {
	NEW,
	RUNNING,
	SUCCESS,
	FAILURE,
}

var state: NodeState
var parent: BehaviourNode
var tree

func start():
	state = NodeState.NEW
	for child in get_children():
		if child is BehaviourNode:
			child.parent = self
			child.tree = self.tree
			child.start()

# Overwrite this function in child nodes
func evaluate() -> NodeState:
	return NodeState.NEW

