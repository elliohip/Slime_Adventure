extends Node

var rand = RandomNumberGenerator.new()

@onready var screen_size = get_viewport().get_visible_rect().size

@onready var player : Player = $Player

@onready var skull_scene = preload("res://Entities/Mobs/Normal_Enemies/Skull.tscn")

@onready var level = 0

@onready var current_world = get_tree().current_scene



var enemy_count = 0;
var enemies = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
