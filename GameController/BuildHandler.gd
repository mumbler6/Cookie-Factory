extends Node2D



var ghostInstance: Node

onready var worldGridScript = load("res://GameController/WorldGrid.cs")
onready var utilsScript = load("res://GameController/Utils.cs")
onready var worldGridObj = worldGridScript.new()
onready var utilsObj = utilsScript.new()

onready var ghostPre = load("res://Objects/Structures/BlockGhost/BlockGhost.tscn")
onready var conveyorPre = load("res://Objects/Structures/Conveyor/ConveyorBelt.tscn")

var placingCooldown: = 0.5
var placingCooldownCounter = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	ghostInstance = ghostPre.instance()
	add_child(ghostInstance)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# ensures spam placing not possible
	if placingCooldownCounter > 0:
		placingCooldownCounter -= _delta

	var mousePos: = get_global_mouse_position()
	var nearestGrid = utilsObj.RoundToNearest100(mousePos)
	ghostInstance.position = nearestGrid
	if (Input.is_action_just_pressed("left_click") && placingCooldownCounter <= 0):
		placingCooldownCounter = placingCooldown
		var conveyorInstance = conveyorPre.instance()
		add_child(conveyorInstance)
		conveyorInstance.position = nearestGrid
		if worldGridObj.AddSpace(nearestGrid, conveyorInstance):
			print("added object at " + str(nearestGrid))
		else: 
			print("failed to add object at " + str(nearestGrid) + ", space taken")

