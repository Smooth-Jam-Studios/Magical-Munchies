class_name HealthManager

@export var max_health: int = 3;
var health: int
signal health_changed(health: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health;

func takeDamage():
	if health > 0:
		health = health - 1;
	health_changed.emit(health);

func heal():
	if health < max_health:
		health = health + 1;
	health_changed.emit(health);

func getHealth():
	return health;
