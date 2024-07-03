class_name Inverter
extends BehaviourNode

var current_child_index = 0

func evaluate():
    var child = get_child(0)
    if (child is BehaviourNode):
        var result = child.evaluate()
        if (result == NodeState.FAILURE):
            return NodeState.SUCCESS
        if (result == NodeState.SUCCESS):
            return NodeState.FAILURE
        if (result == NodeState.RUNNING):
            return NodeState.RUNNING