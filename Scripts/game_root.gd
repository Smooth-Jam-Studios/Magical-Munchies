extends Node

@onready var player: CharacterBody2D = $Player
@onready var inventory: Control = $UI/InventoryInterface
@onready var external_inventory_hide: Control = $UI/InventoryInterface/ExternalInventory


func _ready() -> void: 
	inventory.set_player_inventory_data(player.inventory_data)


	for node in get_tree().get_nodes_in_group("external_inventory"):
		node.toggle_inventory.connect(toggle_inventory_Interface)
		
func toggle_inventory_Interface(external_inventory_owner) -> void: 
		external_inventory_hide.visible = not external_inventory_hide.visible 
		
		if external_inventory_owner and external_inventory_hide.visible:
			inventory.set_external_inventory(external_inventory_owner)
		else:
			inventory.clear_external_inventory()
