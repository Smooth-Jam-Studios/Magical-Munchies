extends Camera2D

@onready var anim

var play: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	anim = $AnimationPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not play:
		if anim:
			anim.play("Drunk")
			play = true;
