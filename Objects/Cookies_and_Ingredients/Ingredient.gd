extends KinematicBody2D
class_name Ingredient

var added_velocity = Vector2()
var is_product = false

func get_class():
	return "Ingredient"

func _physics_process(_delta: float) -> void:
	move_and_slide(added_velocity)
	
