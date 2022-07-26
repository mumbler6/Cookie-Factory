extends Appliance
class_name Oven

func get_class():
	return "Oven"

func _init() -> void:
	recipe_dict = {"Basic": {"Basic": 1}}
	setting = "Basic"
	current_recipe = recipe_dict[setting]

func _on_Oven_body_entered(body: Node) -> void:
	# dont accidentally delete product
	if body.is_product == false:
		add_object(body.get_class(), input)
		print(input)
		body.queue_free()
	elif body.is_product == true:
		has_output_room = false
		
func _on_Oven_body_exited(body: Node) -> void:
	has_output_room = true
	body.is_product = false
