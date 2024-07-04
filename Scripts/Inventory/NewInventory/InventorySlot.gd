extends Resource
class_name InvSlot

const MAX_STACK_SIZE: int = 99

@export var item_data: InvItem
@export_range(1, MAX_STACK_SIZE) var quantity: int = 1 
