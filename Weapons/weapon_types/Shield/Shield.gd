extends Weapon

class_name Sheild

# @onready var globals = get_node("/root/Globals")


@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite.play("default")
	var collide = move_and_collide(Vector2.ZERO)
	
	if (collide != null):
		var tile_position = collide.get_position()
		print(globals.current_world.tile_map)
		#	player.flip(collide.get_normal())
		
		pass
	
	damage = ceil(max(abs(player.velocity.x), abs(player.velocity.y)) / 1000)
	
	



