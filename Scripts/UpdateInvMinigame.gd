extends Control
@onready var inv: Inv = preload("res://InventoryItems/PlayerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	inv.update.connect(update_slots)
	update_slots()


func update_slots():
	for i in range(min(inv.Slots.size(), slots.size())):
		slots[i].update(inv.Slots[i])
