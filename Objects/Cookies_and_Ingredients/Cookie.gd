extends KinematicBody2D
class_name Cookie

var added_velocity = Vector2()
var is_product = false

func get_class():
	return "basic"

func _physics_process(delta: float) -> void:
	move_and_slide(added_velocity)
	
