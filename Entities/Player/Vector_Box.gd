extends Area2D

class_name Vector_Box


@export var max_length: int = 400;

var is_touch_down = false;
var position_start : Vector2;
var position_end : Vector2;
var input_vector : Vector2;

@export var reset_radius : Area2D;

@export var player : Player


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func reset():
	position_start = Vector2.ZERO;
	position_end = Vector2.ZERO;
	input_vector = Vector2.ZERO;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	pass
	
func _draw():
	if is_touch_down:
		draw_line(player.body.position, input_vector, Color.BLUE, 8.0)

func _input(event):
	if not is_touch_down :
		return
	if (event is InputEventMouseMotion):
		position_end = event.position
		input_vector = -(position_end - position_start).limit_length(player.max_acceleration)
		
		
	if (event.is_action_released("ui_touch")):
		is_touch_down = false;
		player.velocity = input_vector
		
		player.weapon.damage = ceil(max(abs(input_vector.x), abs(input_vector.y)) / 1000)
		reset()
		
		
		
		
func _on_input_event(viewport, event, shape_idx):
	
	if (event.is_action_pressed("ui_touch") and player.can_move) :
		is_touch_down = true;
		position_start = event.position
	pass # Replace with function body.
