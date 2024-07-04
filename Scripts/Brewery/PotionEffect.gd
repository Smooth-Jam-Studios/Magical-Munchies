class_name PotionEffect
extends Resource

@export var name: String

func on_activate(_caller: Node):
    print("Potion Effect Activated")

func _update(_caller: Node):
    pass
    
func on_deactivate(_caller: Node):
    print("Potion Effect Deactivated")