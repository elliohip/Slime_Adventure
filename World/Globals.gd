extends Node

var rand = RandomNumberGenerator.new()

@onready var screen_size = get_viewport().get_visible_rect().size

@onready var player : Player = $Player

@onready var skull_scene = preload("res://Entities/Mobs/Normal_Enemies/Skull.tscn")





var enemy_count = 0;
var enemies = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
