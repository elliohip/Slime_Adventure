extends StaticBody2D

class_name Helmet

@export var damage : float = 0.0;
@export var player : Player;

@onready var sprite : Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision_info = move_and_collide(player.velocity)
	if (collision_info):
		player.velocity = player.velocity.bounce()
	pass
	

