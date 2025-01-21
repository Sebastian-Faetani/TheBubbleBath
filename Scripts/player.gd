extends CharacterBody3D

@export var MOUSE_SENS = 0.5

@onready var head = $Head

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta):
	pass
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENS))
		head.rotate_x(deg_to_rad(-event.relative.y * MOUSE_SENS))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-32), deg_to_rad(60))

func _physics_process(delta):
	pass
