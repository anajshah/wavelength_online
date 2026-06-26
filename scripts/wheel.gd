extends Node2D

var speed: float = 0.0
var friction: float = 3.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += speed * delta
	
	if speed > 0:
		speed -= friction * delta
		if speed < 0:
			speed = 0

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var cover = get_node_or_null("../cover_rot")
		if cover and cover.is_rotated == false:
			return
		if speed == 0:
			speed = randf_range(3.0, 8.0)
