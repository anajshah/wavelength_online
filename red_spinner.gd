extends Node2D

var is_hovering: bool = false

func _ready() -> void:
	$Area2D.mouse_entered.connect(_on_mouse_entered)
	$Area2D.mouse_exited.connect(_on_mouse_exited)

#func _process(_delta: float) -> void:
	#if is_hovering and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#var mouse_pos = get_global_mouse_position()
		
		#global_rotation = global_position.angle_to_point(mouse_pos)
		
		#get_viewport().set_input_as_handled()

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if is_hovering and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var mouse_position = get_global_mouse_position()
		global_rotation = global_position.angle_to_point(mouse_position)
		
		get_viewport().set_input_as_handled()

func _on_mouse_entered() -> void:
	is_hovering = true

func _on_mouse_exited() -> void:
	is_hovering = false
