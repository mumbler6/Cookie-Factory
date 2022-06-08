extends Area2D

var direction = Vector2(1, 0)

# dictionary that holds all recpies, only has the basic one for now
var recipe_dict = {"basic": {"flour": 1, "eggs": 2, "butter": 1, "sugar": 1}}

# should be able to change what cookie you are making
var setting = "basic"

var current_ingredients = {}

func _process(delta: float) -> void:
	var current_recipe = recipe_dict[setting]
	
	if has_enough(current_recipe):
		make_cookie(current_recipe)
		print("make cookie")

# checks if current_ingredients has equal or more than required
func has_enough(current_recipe) -> bool:
	if current_ingredients.size() != current_recipe.size():
		return false
	if current_ingredients.hash() == current_recipe.hash():
		return true
		
	for key in current_ingredients.keys():
		if current_ingredients[key] < current_recipe[key]:
			return false
			
	return true

# subtract only what you need, can also spawn cookie in this function
func make_cookie(current_recipe) -> void:
	for key in current_ingredients.keys():
		current_ingredients[key] -= current_recipe[key]

# adds ingredient to current_ingredients
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

# spawned cookie needs to stop after leaving
func _on_Mixer_body_exited(body: Node) -> void:
	body.added_velocity = 0
