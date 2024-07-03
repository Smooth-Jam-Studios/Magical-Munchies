extends Area2D
var player = null 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	player = body
	switch()

	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://Scenes/game_root.tscn")

func switch():
	if Input.is_action_just_pressed("f"):
		get_tree().change_scene_to_file("res://Scenes/Minigame.tscn")
