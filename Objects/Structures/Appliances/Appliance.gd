extends Area2D
class_name Appliance

var direction = Vector2(1, -.5)

# dictionary that holds all recpies, only has the basic one for now, overrided
var recipe_dict = {"Basic": {"Flour": 1, "Egg": 2, "Butter": 1, "Sugar": 1}}
var setting = "Basic"
var current_recipe = recipe_dict[setting]

var is_idle = true
var input = {}
var output = []
var has_output_room = true

onready var timer = get_node("Timer")

# adds body to map
func add_object(body_class, dict) -> void:
	if dict.has(body_class):
		dict[body_class] += 1
	else:
		dict[body_class] = 1

# checks if input has equal or more than required
func has_enough(current_recipe) -> bool:
	if input.size() != current_recipe.size():
		return false
	if input.hash() == current_recipe.hash():
		return true
		
	for key in input.keys():
		if !current_recipe.has(key) or input[key] < current_recipe[key]:
			return false
			
	return true

# subtract from input one recipe worth of ingredients
func make_product(current_recipe) -> void:
	for key in input.keys():
		input[key] -= current_recipe[key]
	output.push_back(setting)
	print(output)

# actually creates an instance of product that can be moved onto conveyor belt
func empty_output() -> void:
	var product = load("res://Objects/Cookies_and_Ingredients/" \
		+ setting + ".tscn").instance() # might have to change scene names to modify
	output.pop_front()
	product.position = position + direction * 100
	product.is_product = true
	get_tree().get_root().add_child(product)
	print(output)

func _on_Timer_timeout() -> void:
	timer.stop()
	make_product(current_recipe)
	is_idle = true

func _process(_delta: float) -> void:
	if has_enough(current_recipe) and is_idle:
		timer.start()
		is_idle = false
	if !output.empty() and has_output_room:
		empty_output()
		
