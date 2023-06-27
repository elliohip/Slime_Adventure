extends Node2D

class_name Level

@onready var globals = get_node("/root/Globals")
@onready var tile_map : TileMap = $TileMap

@onready var max_skel = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	globals.current_world = get_tree().current_scene
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
