class_name SequenceNode
extends BehaviourNode

var current_child_index = 0

func evaluate():
    var children = get_children()

    while current_child_index != children.size():
        var child = children[current_child_index]
        if child is BehaviourNode:
            var result: NodeState = child.evaluate()
            if (result == NodeState.FAILURE):
                return result
            if (result == NodeState.SUCCESS):
                current_child_index += 1
            # Continue with the same node if running
    current_child_index = 0
    return NodeState.SUCCESS
