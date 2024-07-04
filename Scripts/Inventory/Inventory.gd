extends Resource

class_name Inv

signal update

@export var Slots: Array[InvSlot]

func Insert(item: InvItem):
	var itemslots = Slots.filter(func(slot): return slot.item == item)
	if !itemslots.is_empty():
		itemslots[0].amount += 1
	else:
		var emptyslots = Slots.filter(func(slot): return slot.item == null)
		if !emptyslots.is_empty():
			emptyslots[0].item = item
			emptyslots[0].amount = 1
	update.emit()

func clear():
	for slot in Slots:
		slot.item = null
		slot.amount = 0
	update.emit()

#Add to player later
