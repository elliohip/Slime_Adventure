extends Area2D

class_name Vector_Box


@export var max_length: int = 400;

var touch_down = false;
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
	if touch_down:
		draw_line(position_end, position_start, Color.BLUE, 8.0);

func _input(event):
	if not touch_down :
		return
	if (event is InputEventMouseMotion):
		position_end = event.position
		input_vector = -(position_end - position_start).limit_length(max_length)
		
		
	if (event.is_action_released("ui_touch")):
		touch_down = false;
		player.velocity += input_vector
		reset()
		
		
		
		
func _on_input_event(viewport, event, shape_idx):
	
	if (event.is_action_pressed("ui_touch") and player.can_move) :
		touch_down = true;
		position_start = event.position
	pass # Replace with function body.
