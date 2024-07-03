class_name BehaviourTree
extends BehaviourNode

func _init():
	tree = self
	start()

func _process(_delta):
	for child in get_children():
		if child is BehaviourNode:
			child.evaluate()
