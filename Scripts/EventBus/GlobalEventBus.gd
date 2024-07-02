class_name GlobalEventBus
extends Node

signal audio_playsound(sound_name: String)
signal audio_stopsound(sound_name: String)

func play_sound(sound_name: String) -> void:
    emit_signal("audio_playsound", sound_name)

func stop_sound(sound_name: String) -> void:
    emit_signal("audio_stopsound", sound_name)