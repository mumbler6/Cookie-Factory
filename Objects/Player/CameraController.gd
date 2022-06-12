extends Camera2D

var zoom_speed = Vector2(.2, .2)
var zoom_max = Vector2(2, 2)
var zoom_min = Vector2(.6, .6)

func _process(_delta: float) -> void:
	if Input.is_action_just_released("scroll_up") and zoom > zoom_min:
		zoom -= zoom_speed
	if Input.is_action_just_released("scroll_down") and zoom < zoom_max:
		zoom += zoom_speed
