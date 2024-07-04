extends Area2D
var InRange: bool  = false  

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_body_entered(body):
	print("I wodont worrk!")
	InRange = true




func _process(delta):
	if Input.is_action_just_pressed("f") && InRange:
		get_tree().change_scene_to_file("res://Scenes/newMinigame.tscn")

