extends Area2D

var speed = 100
var selected = false
var directions = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]
var index = 0

func _physics_process(_delta: float) -> void:
	handle_overlapping_bodies()
	if Input.is_action_just_pressed("rotate") and selected:
		rotate_structure()

# collision detection 

func _on_ConveyorBelt_body_exited(body: Node) -> void:
	body.added_velocity = Vector2.ZERO
	
func handle_overlapping_bodies():
	var velocity = speed * directions[index]
	var overlapping_bodies = get_overlapping_bodies()
	for body in overlapping_bodies:
		body.added_velocity = velocity
	
# kinda scuffed way of rotating stuff
	
func rotate_structure():
	if index == 3:
		index = 0
	else:
		index += 1
	rotate(PI / 2)
	
func _on_ConveyorBelt_mouse_entered() -> void:
	selected = true

func _on_ConveyorBelt_mouse_exited() -> void:
	selected = false

