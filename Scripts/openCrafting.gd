extends Area2D
var InRange: bool  = false  
signal toggle_inventory(external_inventory_owner)
@export var inventory_data: InventoryData

func _on_body_entered(body):
	print("I wodont worrk!")
	InRange = true

func player_interact() -> void:
	toggle_inventory.emit(self)
	


func _process(delta):
	if Input.is_action_just_pressed("f") && InRange:
		player_interact()
		


func _on_body_exited(body):
	InRange = false
	player_interact()
	
