class_name TaskPlayMusic
extends BehaviourNode

var hasplayed: bool = false

func evaluate():
    if (!hasplayed):
        EventBus.play_sound("PlayerDeath")
        hasplayed = true
    return NodeState.SUCCESS
