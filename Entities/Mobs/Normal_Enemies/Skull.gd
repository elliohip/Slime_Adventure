extends Mob_Base

class_name Skull

@onready var hitbox : Hitbox = $Hitbox

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D


@onready var player : Player 




var target: Vector2 = Vector2(60.0,180.0)

var direction = Vector2.ZERO;


func _ready():
	health = 1
	damage = 1
	speed = 50
	
	call_deferred("actor_setup")

func _process(delta):
	if (health <= 0): 
		queue_free()
	pass

func set_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func actor_setup():
	await get_tree().physics_frame
	
	target = globals.player.position
	
	set_target(target)
	pass

func _physics_process(delta):
	
	
	move_and_slide()



func _on_hitbox_body_entered(body):
	if (body is Hitbox_Body) :
		body.player.apply_damage(1)
		
	if (body is Helmet):
		apply_damage(body.damage)
	
	pass # Replace with function body.

func apply_damage(d):
	health -= d
