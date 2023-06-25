extends Node


@onready var range = preload("res://Weapons/weapon_types/Ranged/ranged.tscn")

@onready var melee = preload("res://Weapons/weapon_types/Dagger/Dagger.tscn")

@onready var sheild = preload("res://Weapons/weapon_types/Shield/Shield.tscn")

@onready var current_weapon = preload("res://Weapons/weapon_types/Shield/Shield.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
