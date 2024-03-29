extends Node2D


onready var worldGridScript = load("res://GameController/WorldGrid.cs")
onready var utilsScript = load("res://GameController/Utils.cs")
onready var worldGridObj = worldGridScript.new()
onready var utilsObj = utilsScript.new()

onready var ghostPre = load("res://Objects/Structures/BlockGhost/BlockGhost.tscn")
var ghostInstance: Node

export var build_list: Array


# onready var conveyorPre = load("res://Objects/Structures/Conveyor/ConveyorBelt.tscn")


var placingCooldown: = 0.5
var placingCooldownCounter = 0.0
var selected_object_id = 0

func _ready():
	if build_list.size() == 0:
		push_error("build list size == 0")

	ghostInstance = ghostPre.instance()
	add_child(ghostInstance)


func _process(_delta: float) -> void:
	# ensures spam placing not possible
	if placingCooldownCounter > 0:
		placingCooldownCounter -= _delta
	# check for number key presses
	for i in range(10):
		if (Input.is_action_just_pressed("press_" + str(i))):
			selected_object_id = (i + 9) % 10
			break
	
	# check for size of selected object
	var footprint: Vector2
	if selected_object_id < build_list.size() && build_list[selected_object_id]._type =="placableObject":
		footprint = build_list[selected_object_id]._footprint
	else:
		footprint = Vector2(1, 1)
		
	ghostInstance.scale = footprint
	
	# moves selected gridposition down and to the left to center the placable object
	var mousePos: = get_global_mouse_position()
	var gridOffset = 50 * Vector2(-footprint.x, footprint.y)
	var nearestGrid = utilsObj.RoundToNearest100(mousePos + gridOffset)
	ghostInstance.position = nearestGrid

			
	
	# check for LMB
	if (Input.is_action_just_pressed("left_click") && placingCooldownCounter <= 0):
		placingCooldownCounter = placingCooldown
		if selected_object_id >= build_list.size():
			print("placable object does not exist at index: " + str(selected_object_id))
		else:
			var placed: bool = place_object(build_list[selected_object_id], nearestGrid)

			if placed:
				print("added object at " + str(nearestGrid))
			else: 
				print("failed to add object at " + str(nearestGrid) + ", space taken")
			

func place_object(object: Resource, nearestGrid: Vector2) -> bool:
	var objectInstance = object._model.instance();            
	objectInstance.position = nearestGrid
	add_child(objectInstance)

	# allows placing of ingredients [debug]
	if object._type == "placableObject":
		var placed: bool = worldGridObj.TryPlaceObject(nearestGrid, object._footprint, objectInstance)
		if !placed:
			objectInstance.queue_free()
		return placed
	return true
