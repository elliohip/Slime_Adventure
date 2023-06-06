extends Hitbox

class_name Hitbox_Body


@export var player : Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_body_entered(body):
	if (body is Mob_Base):
		player.apply_damage(body.damage)
	pass # Replace with function body.
