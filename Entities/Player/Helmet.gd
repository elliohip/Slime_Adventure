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
	var collide = move_and_collide(Vector2.ZERO)
	
	if (collide != null and collide.get_class() == "Main_Wall"):
		player.flip(collide.get_normal())
		
		pass
	
	pass
	
	damage = ceil(max(abs(player.velocity.x), abs(player.velocity.y)) / 1000)
	

