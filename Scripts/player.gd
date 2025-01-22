extends CharacterBody3D

@export var MOUSE_SENS = 0.5
@onready var head = $Head
@onready var interact_ray: RayCast3D = $Head/Camera3D/InteractRay
@onready var camera_3d: Camera3D = $Head/Camera3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENS))
		head.rotate_x(deg_to_rad(-event.relative.y * MOUSE_SENS))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-32), deg_to_rad(60))


func _physics_process(delta):
	if %InteractRay.is_colliding():
		Global.canInteract = true
		var target = %InteractRay.get_collider()
		if Input.is_action_just_released("interact"):
			if target.is_in_group("window") and GameManager.WindowOpened == false:
				GameManager.WindowOpening = true
			else:
				GameManager.WindowClosing = true
		if target.is_in_group("corridor") and GameManager.BoggartOn == true:
				print("GO AWAY BOGGART")
		else:
			Global.canInteract = false
		
