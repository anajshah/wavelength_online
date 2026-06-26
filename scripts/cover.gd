extends Node2D

var is_rotated: bool = false
var rotation_tween: Tween
var rotation_direction: float = -1.0

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		toggle_rotation()

func toggle_rotation() -> void:
	if rotation_tween and rotation_tween.is_running():
		return
		
	var target_angle = rotation_degrees + (180.0 * rotation_direction)
	
	rotation_tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	rotation_tween.tween_property(self, "rotation_degrees", target_angle, 0.5)
	rotation_direction *= -1.0
