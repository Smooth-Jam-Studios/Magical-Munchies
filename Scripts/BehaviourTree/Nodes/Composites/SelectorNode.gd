class_name SelectorNode
extends BehaviourNode

var current_child_index = 0

func evaluate():
	var children = get_children()

	while current_child_index < children.size():
		var child = children[current_child_index]
		if child is BehaviourNode:
			var result = child.evaluate()
			if (result == NodeState.FAILURE):
				current_child_index += 1
			if (result == NodeState.SUCCESS):
				current_child_index = 0
				return result
			# Continue with the same node if running
