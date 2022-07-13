extends Area2D
class_name IngredientSpawner

export var setting = "Flour"
var direction = Vector2(1, -.5)
var has_output_room = true
var is_idle = true

onready var timer = get_node("Timer")

func _process(_delta: float) -> void:
	if has_output_room and is_idle:
		is_idle = false
		timer.start()
		spawn_ingredient()


func spawn_ingredient():
	var product = load("res://Objects/Cookies_and_Ingredients/" \
		+ setting + ".tscn").instance() # might have to change scene names to modify
	product.position = position + direction * 100
	get_tree().get_root().add_child(product)
		
func _on_IngredientSpawner_body_entered(body: Node) -> void:
	has_output_room = false

func _on_IngredientSpawner_body_exited(body: Node) -> void:
	has_output_room = true
	
func _on_Timer_timeout() -> void:
	timer.stop()
	is_idle = true
	

