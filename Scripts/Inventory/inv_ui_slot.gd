extends Panel

@onready var ItemVisual: Sprite2D = $CenterContainer/Panel/ItemDisplay
@onready var amount_text: Label = $CenterContainer/Panel/Label

func update(slot: InvSlot):
	if !slot.item:
		ItemVisual.visible = false
		amount_text.visible = false
	else:
		ItemVisual.visible = true
		ItemVisual.texture = slot.item.texture
		if slot.amount > 1: 
			amount_text.visible = true
		amount_text.text = str(slot.amount)
