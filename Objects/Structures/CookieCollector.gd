extends Area2D
class_name CookieCollector

var direction = Vector2(1, 0)

func _on_CookieCollector_body_entered(body: Node) -> void:
	print("hi")
	if body.is_class("Basic"):
		body.queue_free()
