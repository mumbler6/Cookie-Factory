extends KinematicBody2D
class_name Cookie

var added_velocity = Vector2()

func _physics_process(delta: float) -> void:
	move_and_slide(added_velocity)
	
