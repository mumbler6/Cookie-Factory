extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(10):
		if (Input.is_action_just_pressed("press_" + str(i))):
			text = str(i if i != 0 else 10)
			break
