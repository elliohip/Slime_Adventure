extends StaticBody2D

class_name Weapon

@onready var current_weapon = preload("res://Weapons/weapon_types/Shield/Shield.tscn")

@export var damage : float = 0.0
@onready var globals = get_node("/root/Globals")
@onready var player : Player = globals.player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func attack():
	pass
