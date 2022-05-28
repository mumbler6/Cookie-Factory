extends Area2D

var direction = Vector2(1, 0)
var speed = 100

# functions for changing direction of belt needed? 


# collision detection 

func _on_ConveyorBelt_body_entered(body: Node) -> void:
	var velocity = speed * direction 
	body.added_velocity = velocity

func _on_ConveyorBelt_body_exited(body: Node) -> void:
	body.added_velocity = Vector2.ZERO
