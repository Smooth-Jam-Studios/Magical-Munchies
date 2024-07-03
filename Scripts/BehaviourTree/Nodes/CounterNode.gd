class_name CounterNode
extends BehaviourNode

var count = 0

const MAX = 100


func evaluate():
  if state == NodeState.RUNNING or state == NodeState.NEW:
    count += 1
    if count <= MAX:
      print(count)
      return NodeState.RUNNING
    else:
      count = 0
      return NodeState.SUCCESS