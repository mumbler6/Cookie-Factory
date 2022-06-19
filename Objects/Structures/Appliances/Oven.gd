extends Appliance
class_name Oven

func _init() -> void:
	recipe_dict = {"basic": {"basic": 1}}
	setting = "basic"
	current_recipe = recipe_dict[setting]

func _on_Oven_body_entered(body: Node) -> void:
	# dont accidentally delete product
	print(recipe_dict)
	if body.is_product == false:
		var body_class = body.get_class()
		add_object(body_class, input)
		print(input)
		body.queue_free()
		
func _on_Oven_body_exited(body: Node) -> void:
	body.is_product = false
