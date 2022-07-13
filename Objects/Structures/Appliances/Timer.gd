extends Timer

func _ready() -> void:
	if get_parent().get_class() == "mixer":
		wait_time = 3.0
	elif get_parent().get_class() == "oven":
		wait_time = 1.0
