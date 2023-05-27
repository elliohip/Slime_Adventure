extends Area2D


@export var max_length: int = 200;

var touch_down = false;
var position_start : Vector2;
var position_end : Vector2;
var input_vector : Vector2;

@export var reset_radius : Area2D;


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	
	if (event is InputEventMouse and event.is_action_pressed("ui_touch")) :
		
		pass
	if (event is InputEventMouseMotion):
		position_end = event.position
		input_vector = -(position_end - position_start).limit_length(max_length)

func _on_input_event(viewport, event, shape_idx):
	
	if (event.is_action_pressed("ui_touch")) :
		touch_down = true;
		position_start = event.position
	pass # Replace with function body.
