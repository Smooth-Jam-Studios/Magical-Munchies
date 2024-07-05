extends Camera2D

@onready var anim
@onready var limited

var playing: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	anim = $AnimationPlayer
	limited = $limitedvision


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not playing: # set better check for when Heroine is activated
		if anim:
			limited.visible = true
			anim.play("Drunk")
			playing = true;
