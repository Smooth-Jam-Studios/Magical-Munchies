extends Control
@onready var inv: Inv = preload("res://InventoryItems/PlayerInventory.tres")
@onready var itemStackGuiClass = preload("res://Scenes/ItemStackGui.tscn") 
@onready var slots: Array = $NinePatchRect.get_children() 



var itemInHand: ItemStackGui

func _ready():
	connectSlots()
	# inv.update.connect(update_slots)
	# update_slots()

func connectSlots():
	for i in range(inv.Slots.size()):
		var slot = slots[i]
		slot.index = i


		var callable = Callable(onSlotClicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)

# func update_slots():
# 	for i in range(min(inv.Slots.size(), slots.size())):
# 		var inventorySlot: InvSlot = inv.Slots[i]

# 		if !inventorySlot.item: continue

# 		var itemStackGui: ItemStackGui = slots[i].itemStackGui
# 		if !itemStackGui:
# 			itemStackGui = itemStackGuiClass.instantiate()
# 			slots[i].insert(itemStackGui)

# 		itemStackGui.inventorySlot = inventorySlot
# 		itemStackGui.update()

func onSlotClicked(slot):
	if slot.isEmpty() && itemInHand:
		insertItemInSlot(slot)
		return 
	if !itemInHand:
		takeItemFromSlot(slot)


func takeItemFromSlot(slot):
	print("nnjnjnjn")
	itemInHand = slot.takeItem()
	add_child(itemInHand)
	updateItemInHand()


func insertItemInSlot(slot):
	var item = itemInHand

	remove_child(itemInHand)
	itemInHand = null

	slot.insert(item)

func updateItemInHand():
	if !itemInHand: return
	itemInHand.global_position = get_global_mouse_position() - itemInHand.size/2

func _input(event):
	updateItemInHand()
