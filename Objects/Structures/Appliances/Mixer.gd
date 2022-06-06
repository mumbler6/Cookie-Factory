extends Area2D

var direction = Vector2(1, 0)

# dictionary that holds all recpies, only has the basic one for now
var recipe_dict = {"basic": {"flour": 1, "eggs": 2, "butter": 1, "sugar": 1}}

# should be able to change what cookie you are making
var setting = "basic"

# variable of what ingredients are currently inside the mixer
var current_ingredients = {}

func _process(delta: float) -> void:
	var current_recipe = recipe_dict[setting]
	
	if current_ingredients.hash() == current_recipe.hash():
		current_ingredients = {}
		print("make cookie")
		
		# create a new cookie node and move it out

func add_ingredient(body_class) -> void:
	if current_ingredients.has(body_class):
		current_ingredients[body_class] += 1
	else:
		current_ingredients[body_class] = 1
	
func _on_Mixer_body_entered(body: Node) -> void:
	var body_class = body.get_class()
	add_ingredient(body_class)
	print(current_ingredients)
	body.queue_free()


func _on_Mixer_body_exited(body: Node) -> void:
	body.added_velocity = 0
