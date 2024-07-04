class_name HealthManager

var health: int = 3;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func takeDamage():
	if health > 0:
		health = health - 1;

func heal():
	if health < 3:
		health = health + 1;

func getHealth():
	return health;
