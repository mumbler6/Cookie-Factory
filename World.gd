extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	if Input.is_action_pressed("right_click"):
		# create conveyor belt at location (mouse_pos.x, mouse_pos.y)
		print("created a conveyor belt")
