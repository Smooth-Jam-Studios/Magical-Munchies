extends Control
@onready var inv: Inv = preload("res://InventoryItems/PlayerInventory.tres")
@onready var itemStackGuiClass = preload("res://Scenes/ItemStackGui.tscn") 
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	connectSlots()
	inv.update.connect(update_slots)
	update_slots()

func connectSlots():
	for slot in slots:
		var callable = Callable(onSlotClicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)

func update_slots():
	for i in range(min(inv.Slots.size(), slots.size())):
		var inventorySlot: InvSlot = inv.Slots[i]

		if !inventorySlot.item: continue

		var itemStackGui: ItemStackGui = slots[i].itemStackGui
		if !itemStackGui:
			itemStackGui = itemStackGuiClass.instantiate()
			slots[i].insert(itemStackGui)

		itemStackGui.inventorySlot = inventorySlot
		itemStackGui.update()

func onSlotClicked(slot):
	print("nnjnjnjn")
