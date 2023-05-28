extends Entity_Base

class_name Player

@export var acceleration : int = 0;

var friction = 20;


# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):
	
	move_and_slide()


func apply_friction() :
	velocity.move_toward(Vector2.ZERO, friction)

func flip():
	# Todo, should flip the player, and make the velocity negative
	velocity = -(velocity);
	pass
