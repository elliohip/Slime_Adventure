extends CharacterBody2D

class_name Entity_Base


var health = 0
var knockback_resist : float = 1.0

@onready var globals = get_node("/root/Globals")

var knockback = 0

var is_knockback = false;

var damage = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
