extends Timer

func _ready() -> void:
	if get_parent().get_class() == "Mixer":
		wait_time = 3.0
	elif get_parent().get_class() == "Oven":
		wait_time = 1.0
	elif get_parent().get_class() == "IngredientSpawner":
		wait_time = 1.0
