extends Area2D
class_name IngredientSpawner

export var setting = "Flour"
var direction = Vector2(1, -.5)
var has_output_room = true

func _process(_delta: float) -> void:
	if has_output_room:
		var product = load("res://Objects/Cookies_and_Ingredients/" \
			+ setting + ".tscn").instance() # might have to change scene names to modify
		product.position = position + direction * 100
		product.is_product = true
		get_tree().get_root().add_child(product)
