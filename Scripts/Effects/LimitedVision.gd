extends AnimationPlayer

@onready var anim
@onready var limited

var playing: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	anim = self
	limited = $GameRoot/Player/Camera2D/limitedvision


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not playing: # set better check for when drunk is activated
		if anim:
			limited.visible = true
			anim.play("Drunk")
			playing = true;
