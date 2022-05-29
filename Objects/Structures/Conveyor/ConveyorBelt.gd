extends Area2D

var direction = Vector2(1, 0)
var speed = 100

# functions for changing direction of belt needed? 


# collision detection 

func _on_ConveyorBelt_body_exited(body: Node) -> void:
	body.added_velocity = Vector2.ZERO
	
func handle_overlapping_bodies():
	var velocity = speed * direction 
	var overlapping_bodies = get_overlapping_bodies()
	for body in overlapping_bodies:
		body.added_velocity = velocity

func _physics_process(delta: float) -> void:
	handle_overlapping_bodies()
