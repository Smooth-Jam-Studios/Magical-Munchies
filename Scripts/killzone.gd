extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(_body: Node2D) -> void:
	timer.start()
	var player:PlayerActor = _body
	player.inv.clear()
	EventBus.stop_all_sounds_in_bus(AudioBus.BusTypes.MUSIC)
	EventBus.play_sound("PlayerDeath")

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
