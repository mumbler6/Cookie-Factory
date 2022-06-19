extends Appliance
class_name Mixer

func _init() -> void:
	recipe_dict = {"basic": {"flour": 1, "eggs": 2, "butter": 1, "sugar": 1}}

	setting = "basic"
	current_recipe = recipe_dict[setting]

func _on_Mixer_body_entered(body: Node) -> void:
	# dont accidentally delete product
	if body.is_product == false:
		var body_class = body.get_class()
		add_object(body_class, input)
		print(input)
		body.queue_free()

func _on_Mixer_body_exited(body: Node) -> void:
	body.is_product = false


