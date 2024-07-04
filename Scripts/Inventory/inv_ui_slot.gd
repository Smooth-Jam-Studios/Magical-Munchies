extends Button

@onready var container: CenterContainer = $CenterContainer
@onready var background: Sprite2D = $Sprite2D

var itemStackGui: ItemStackGui

func insert(isg: ItemStackGui):
	itemStackGui = isg 
	background.frame= 1
	container.add_child(itemStackGui)