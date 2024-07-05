extends AnimationPlayer

@onready var anim
@onready var blurry

var playing: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	anim = self
	blurry = $blurryvision


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not playing: # set better check for when drunk is activated
		if anim:
			blurry.visible = true
			anim.play("Drunk")
			playing = true;
