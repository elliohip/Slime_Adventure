extends Entity_Base

class_name Player

@export var max_acceleration : int = 750;

var friction = 100;

var can_move = true;

@onready var helmet : Helmet = $Helmet;
@onready var body : Hitbox = $Hitbox_Body;
@onready var helmet_marker : Marker2D = $Helmet_Marker;
@onready var body_marker : Marker2D = $Player_Marker;

var movement_direction : Vector2



@export var vector_box : Vector_Box;

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D;


var helmet_position : Vector2;
var helmet_magnitude : int = 72;

var collision;


# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	health = 1;
	


func _physics_process(delta):
	
	movement_direction = velocity.normalized()
	
	update_helmet();

	apply_friction();
	
	# sets the can move variable for if the player can move
	if (velocity == Vector2.ZERO):
		can_move = true;
	else : 
		can_move = false;
		
		
		
	move_and_slide();
	

func update_helmet():
	
	if (vector_box.is_touch_down) :
		helmet_position = (vector_box.input_vector.normalized() * helmet_magnitude)
		helmet_marker.position = helmet_position
		helmet.position = helmet_position
		body_marker.position = body.position
		var rotate_vector = Vector2(helmet_position.x - body_marker.position.x, helmet_position.y - body_marker.position.y);
		helmet.rotation_degrees = rad_to_deg(rotate_vector.orthogonal().angle())
		# print(rotate_vector)
		
	else :
		if (movement_direction.length() != 0) :
			
			helmet.position = movement_direction * helmet_magnitude;
			helmet.rotation_degrees = rad_to_deg(movement_direction.orthogonal().angle())
			#helmet.transform.r = (movement_direction * helmet_magnitude).angle();
			#helmet.transform.rotation = (movement_direction * helmet_magnitude).angle();
	
	pass


func apply_friction() :
	velocity = velocity.move_toward(Vector2.ZERO, 25)
	# print(velocity)

func flip(normal):
	# Todo, should flip the player, and make the velocity negative
	velocity = velocity.bounce(normal);
	
	
	pass
	
func handle_collision():
	var collide = move_and_collide(Vector2.ZERO)
	
	if (collide != null):
		flip(collide.get_normal())
		pass
	
	pass
	
		

func apply_damage(d) : 
	health = health - d;
