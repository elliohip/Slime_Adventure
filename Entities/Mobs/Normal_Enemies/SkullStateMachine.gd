extends Node2D

class_name SkullStateMachine

var current_state = null

var states = []


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		states.append(child)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
