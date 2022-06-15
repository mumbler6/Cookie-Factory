extends Area2D

var direction = Vector2(1, 0)

# dictionary that holds all recpies, only has the basic one for now
var recipe_dict = {"basic": {"flour": 1, "eggs": 2, "butter": 1, "sugar": 1}}

# should be able to change what cookie you are making
var setting = "basic"
var current_recipe = recipe_dict[setting]
onready var timer = get_node("Timer")

var is_idle = true
var input = {}
var output = {}

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
	add_object("basic", output)
	print(output)

# actually creates an instance of product that can be moved onto conveyor belt
func empty_output() -> void:
	var product = load("res://Objects/Cookies_and_Ingredients/" \
		+ "Cookie.tscn").instance()
	output[product.get_class()] -= 1
	product.position = position + direction * 50
	product.is_product = true
	get_tree().get_root().add_child(product)
	print(output)

func _on_Timer_timeout() -> void:
	print("make cookie")
	timer.stop()
	make_product(current_recipe)
	
	# if there is an output conveyor belt nearby...
	empty_output()
	is_idle = true

func _process(_delta: float) -> void:
	if has_enough(current_recipe) and is_idle:
		timer.start()
		is_idle = false

func _on_Mixer_body_entered(body: Node) -> void:
	# dont accidentally delete product
	if body.is_product == false:
		var body_class = body.get_class()
		add_object(body_class, input)
		print(input)
		body.queue_free()

func _on_Mixer_body_exited(body: Node) -> void:
	body.is_product = false


