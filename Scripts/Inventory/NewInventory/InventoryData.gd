extends Resource
class_name InvData


signal inventory_updated(inventory_data: InvData)
signal inventory_interact(inventory_data: InvData, index: int, button: int)
signal name(slot_data)

@export var slot_datas: Array[InvSlot]
@export var naam: String = ""

func grab_slot_data(index: int) -> InvSlot:
	var slot_data = slot_datas[index]

	if slot_data:
		slot_datas[index] = null
		inventory_updated.emit(self)
		return slot_data
	else:
		return null 

func drop_slot_data(grabbed_slot_data: InvSlot, index: int) -> InvSlot:
	var slot_data = slot_datas[index]

	slot_datas[index] = grabbed_slot_data
	inventory_updated.emit(self)
	return slot_data

func use_slot_data(index):
	var slot_data = slot_datas[index]

	if not slot_data:
		return 
		
	print(slot_data.item_data.name) 
	send_name(index)

func send_name(index):
	var slot_data = slot_datas[index]
	var naam = slot_data.item_data.name
	return naam



func pick_up_slot_data(slot_data: InvSlot)-> bool:
	for index in slot_datas.size():
		if not slot_datas[index]:
			slot_datas[index] = slot_data
			inventory_updated.emit(self)
			return true
	return false

func on_slot_clicked(index: int, button: int) -> void:
	inventory_interact.emit(self, index, button)