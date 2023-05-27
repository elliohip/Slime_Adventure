extends Entity_Base

class_name Player

@export var acceleration : int = 0;


# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):
	
	move_and_slide()
