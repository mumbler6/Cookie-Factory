extends Appliance
class_name Mixer

func get_class():
	return "Mixer"

func _init() -> void:
	recipe_dict = {"Basic": {"Flour": 1, "Egg": 2, "Butter": 1, "Sugar": 1}}

	setting = "Basic"
	current_recipe = recipe_dict[setting]

func _on_Mixer_body_entered(body: Node) -> void:
	# dont accidentally delete product
	if body.is_product == false:
		var body_class = body.get_class()
		add_object(body_class, input)
		print(input)
		body.queue_free()
	elif body.is_product == true:
		has_output_room = false

func _on_Mixer_body_exited(body: Node) -> void:
	has_output_room = true
	body.is_product = false


