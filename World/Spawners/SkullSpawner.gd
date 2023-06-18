extends Node2D


@onready var globals = get_node("/root/Globals")

@onready var spawn_count = globals.level + 1

@export var world : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# print(globals.enemy_count)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (len(globals.enemies) == 0 and globals.enemy_count != 0):
		spawn_skulls()
	pass
	
func spawn_skulls():
	for i in range(0, spawn_count):
			var enemy = globals.skull_scene.instantiate()
			globals.enemies.append(enemy)
			
			globals.rand.randomize()
			enemy.position.x = globals.rand.randi_range(0, globals.screen_size.x)
			globals.rand.randomize()
			enemy.position.y = globals.rand.randi_range(0, globals.screen_size.y)
			world.add_child(enemy)
	pass # Replace with function body.
	
	spawn_count += 1;
