extends Entity_Base

class_name Player

@export var acceleration : int = 0;

var friction = 100;

var can_move = true;


# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):
	
	apply_friction();
	
	# sets the can move variable for if the player can move
	if (velocity == Vector2.ZERO):
		can_move = true;
	
	
	move_and_slide();


func apply_friction() :
	velocity = velocity.move_toward(Vector2.ZERO, 1.0)
	print(velocity)

func flip():
	# Todo, should flip the player, and make the velocity negative
	velocity = -(velocity);
	pass
