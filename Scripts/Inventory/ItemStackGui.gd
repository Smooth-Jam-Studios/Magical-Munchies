extends Panel

class_name ItemStackGui
var inventorySlot: InvSlot 

@onready var ItemVisual: Sprite2D = $ItemDisplay
@onready var amount_text: Label = $Label


# func update():
#     if !inventorySlot||inventorySlot.item: return

#     ItemVisual.visible = true
#     ItemVisual.texture = inventorySlot.item.texture
		
#     if inventorySlot.amount > 1:
#         amount_text.visible = true
#         amount_text.text = str(inventorySlot.amount)
#     else: 
#         amount_text.visible = false 

func update():
	if !inventorySlot.item:
		ItemVisual.visible = false
		amount_text.visible = false
	else:
		ItemVisual.visible = true
		ItemVisual.texture = inventorySlot.item.texture
		if inventorySlot.amount > 1: 
			amount_text.visible = true
		amount_text.text = str(inventorySlot.amount)