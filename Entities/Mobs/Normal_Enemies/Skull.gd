extends Mob_Base

class_name Skull

@onready var hitbox : Hitbox = $Hitbox

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

@onready var player : Player 

@onready var state_machine = $SkullStateMachine

# var globals = get_node("/root/Globals")





var target: Vector2 = Vector2(60.0,180.0)

var direction = Vector2.ZERO;


func _ready():
	health = 1
	damage = 1
	speed = 50
	
	max_speed = 100
	
	call_deferred("actor_setup")

func _process(delta):
	if (health <= 0): 
		die()
	pass

func die():
	globals.enemies.erase(self)
	queue_free()

func set_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func actor_setup():
	await get_tree().physics_frame
	
	target = globals.player.position
	
	set_target(target)
	pass

func _physics_process(delta):
	if (navigation_agent.is_navigation_finished()):
		return
		
	if (is_knockback):
		update_knockback()
		is_knockback = false
		move_and_slide()
		
		return
		
	
	if (globals.player.position != navigation_agent.target_position):
		
		set_target(globals.player.position)
		
	var current_agent_position: Vector2 = global_position
	var next_position: Vector2 = navigation_agent.get_next_path_position()
	
	var next_velocity = next_position - current_agent_position
	
	velocity = velocity.move_toward(next_velocity.normalized() * max_speed, speed) 
	
	direction = next_velocity.normalized()
	
	move_and_slide()



func _on_hitbox_body_entered(body):
	if (body is Hitbox_Body) :
		body.player.apply_damage(1)
		
	if (body is Sheild):
		print(body.damage)
		apply_damage(body.damage)
		knock()
		
	
	pass # Replace with function body.

func apply_damage(d):
	health -= d

func knock():
	is_knockback = true
	

func update_knockback():
	var knockback_vector = Vector2.ZERO
	
	if (position.y <= globals.player.position.y):
		knockback_vector.y = -50
		if (position.x < globals.player.position.x):
			knockback_vector.x = -500
		else:
			knockback_vector.x = 500
			
			
	else:
		
		knockback_vector.y = 50
		if (position.x < globals.player.position.x):
			knockback_vector.x = -500
		else:
			knockback_vector.x = 500
			
	print(knockback_vector)
	velocity = knockback_vector
	
	
