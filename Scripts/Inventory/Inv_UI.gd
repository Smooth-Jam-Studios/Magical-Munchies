extends Control

@onready var inv: Inv = preload("res://InventoryItems/PlayerInventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


var is_open = false

func _ready():
	inv.update.connect(update_slots)
	update_slots()
	close()

func update_slots():
	for i in range(min(inv.Slots.size(), slots.size())):
		slots[i].update(inv.Slots[i])

func _process(delta):
	if Input.is_action_just_pressed("e"):
		if is_open:
			close()
		else:
			open()


func open():
	visible = true 
	is_open = true 

func close():
	visible = false
	is_open = false
