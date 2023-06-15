extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (len(enemies) == 0 and enemy_count != 0):
		for i in range(0,enemy_count):
			var enemy = skull_scene.instantiate()
			enemies.append(enemy)
			
			rand.randomize()
			enemy.position.x = rand.randi_range(0, screen_size.x)
			rand.randomize()
			enemy.position.y = rand.randi_range(0, screen_size.y)
			
		pass # Replace with function body.
	pass
