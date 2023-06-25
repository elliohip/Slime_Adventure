extends Entity_Base

class_name Player


@export var max_acceleration : int = 750;

@onready var weapon_types = get_node("/root/WeaponTypes")

var friction = 100;

var can_move = true;

@onready var weapon = weapon_types.current_weapon.instantiate()
@onready var body : Hitbox = $Hitbox_Body;
@onready var weapon_marker : Marker2D = $Helmet_Marker;
@onready var body_marker : Marker2D = $Player_Marker;

var movement_direction : Vector2



@export var vector_box : Vector_Box;

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D;


var weapon_position : Vector2;
var weapon_magnitude : int = 72;

var collision;


# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	Globals.set("player", self)
	health = 1;
	
	add_child(weapon)
	weapon.position = weapon_marker.position
	
	


func _physics_process(delta):
	
	movement_direction = velocity.normalized()
	
	
	# print(globals.enemy_count)
	
	update_helmet();
	
	handle_collision();

	apply_friction();
	
	# sets the can move variable for if the player can move
	if (velocity == Vector2.ZERO):
		can_move = true;
	else : 
		can_move = false;
		
		
	if (health <= 0) :
		die()
		
	move_and_slide();
	

func update_helmet():
	
	if (vector_box.is_touch_down) :
		weapon_position = (vector_box.input_vector.normalized() * weapon_magnitude)
		weapon_marker.position = weapon_position
		weapon.position = weapon_position
		body_marker.position = body.position
		var rotate_vector = Vector2(weapon_position.x - body_marker.position.x, weapon_position.y - body_marker.position.y);
		weapon.rotation_degrees = rad_to_deg(rotate_vector.orthogonal().angle())
		# print(rotate_vector)
		
	else :
		if (movement_direction.length() != 0) :
			
			weapon.position = movement_direction * weapon_magnitude;
			weapon.rotation_degrees = rad_to_deg(movement_direction.orthogonal().angle())
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
	if (weapon is Weapon):
		var collide = weapon.move_and_collide(Vector2.ZERO)
	
		if (collide != null and collide.get_class() == "Main_Wall"):
		
			print(collide.get_collider().get_class())
			flip(collide.get_normal())
			pass
	
		pass
	
		

func apply_damage(d) : 
	health = health - d;

func die():
	# TODO add animation
	
	queue_free();
