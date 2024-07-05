class_name HealthManager
extends Node

@export var max_health: int = 3;
var health: int
var invincible: bool = false
signal health_changed(health: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health;

func takeDamage():
	if health > 0 && !invincible:
		health = health - 1;
	health_changed.emit(health);

func heal():
	if health < max_health && !invincible:
		health = health + 1;
	health_changed.emit(health);

func getHealth():
	return health;
