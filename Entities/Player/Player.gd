extends Entity_Base

class_name Player

@export var acceleration : int = 0;

var friction = 100;

var can_move = true;

@onready var helmet : Hurtbox = $Hurtbox_Helmet;
@onready var body : Hitbox = $Hitbox_Body;
@onready var helmet_marker : Marker2D = $Helmet_Marker;
@onready var body_marker : Marker2D = $Player_Marker;

@export var vector_box : Vector_Box;


var helmet_direction : Vector2;
var helmet_magnitude : int = -83;


# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):
	
	apply_friction();
	
	# sets the can move variable for if the player can move
	if (velocity == Vector2.ZERO):
		can_move = true;
	else : 
		can_move = false;
		
	
	update_helmet()
	
	move_and_slide();


func update_helmet():
	helmet_direction = -(vector_box.input_vector.limit_length(83))
	helmet_marker.rotate(helmet_direction.angle());
	helmet.position = helmet_marker.position
	
	
	pass


func apply_friction() :
	velocity = velocity.move_toward(Vector2.ZERO, 1.3)
	# print(velocity)

func flip(normal):
	# Todo, should flip the player, and make the velocity negative
	velocity = velocity.bounce(normal);
	pass
