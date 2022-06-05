extends Area2D

var direction = Vector2(1, 0)
var needed_ingredients = ["flour", "egg", "butter", "salt", "sugar"]

func _on_Mixer_body_entered(body: Node) -> void:
		body.queue_free()
