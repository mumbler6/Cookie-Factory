extends Area2D
class_name IngredientSpawner

# current method of detecting if there is room to spawn doesn't work with rotate

var selected = false
var directions = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]
var index = 0

var has_output_room = true
var is_idle = true
export var setting = "Flour"

onready var timer = get_node("Timer")

func _process(_delta: float) -> void:
	if has_output_room and is_idle:
		is_idle = false
		timer.start()
		spawn_ingredient()
	if Input.is_action_just_pressed("rotate") and selected:
		has_output_room = true
		rotate_structure()

func spawn_ingredient():
	var product = load("res://Objects/Cookies_and_Ingredients/" \
		+ setting + ".tscn").instance()
	product.position = position + directions[index] * 50
	get_parent().add_child(product)
		
func _on_IngredientSpawner_body_entered(body: Node) -> void:
	has_output_room = false

func _on_IngredientSpawner_body_exited(body: Node) -> void:
	has_output_room = true
	
func _on_Timer_timeout() -> void:
	timer.stop()
	is_idle = true

# kinda scuffed way of rotating stuff

func rotate_structure():
	if index == 3:
		index = 0
	else:
		index += 1
	rotate(PI / 2)
	
func _on_IngredientSpawner_mouse_entered() -> void:
	selected = true
	
func _on_IngredientSpawner_mouse_exited() -> void:
	selected = false

