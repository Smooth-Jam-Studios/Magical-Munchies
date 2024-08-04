extends Node

@onready var player: CharacterBody2D = $Player
@onready var inventory: Control = $UI/InventoryInterface


func _ready() -> void: 
	inventory.set_player_inventory_data(player.inventory_data)

