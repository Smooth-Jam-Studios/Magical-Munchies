class_name PotionNode
extends Node

@export var effects: Array[PotionEffect]

func _ready():
	for effect in effects:
		activate_effect(effect.name)

func activate_effect(potion_name: String):
	for effect in effects:
		if effect.name == potion_name:
			var container = PotionContainer.new()
			container.effect = effect
			add_child(container)