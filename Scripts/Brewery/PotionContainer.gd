class_name PotionContainer
extends Node

var effect: PotionEffect
var duration: float = 10
var time_active: float = 0

func _ready():
    effect.on_activate(get_parent())

func _process(delta):
    time_active += delta
    if time_active >= duration:
        effect.on_deactivate(get_parent())
        queue_free()
        return
    effect._update(self)
