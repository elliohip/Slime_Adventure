extends Mob_Base

class_name Skull

@onready var hitbox : Hitbox = $Hitbox


func _ready():
	damage = 1



func _physics_process(delta):
	
	
	move_and_slide()



func _on_hitbox_body_entered(body):
	if (body is Hitbox_Body) :
		body.player.apply_damage(1)
		
	if (body is Helmet):
		apply_damage(body.damage)
	
	pass # Replace with function body.

func apply_damage(d):
	damage -= d;
