extends Area2D
class_name CookieCollector

var selected = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("rotate") and selected:
		rotate_structure()

func _on_CookieCollector_body_entered(body: Node) -> void:
	if body.get_class() == "Basic":
		body.queue_free()
	
func rotate_structure():
	rotate(PI / 2)

func _on_CookieCollector_mouse_entered() -> void:
	selected = true

func _on_CookieCollector_mouse_exited() -> void:
	selected = false
