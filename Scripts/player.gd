extends CharacterBody3D

@export var MOUSE_SENS = 0.5
@export var showerProg = 0
@export var showerMax = 100

@onready var head = $Head
@onready var interact_ray: RayCast3D = $Head/Camera3D/InteractRay
@onready var camera_3d: Camera3D = $Head/Camera3D
@onready var eyes_open_ui: Control = $EyesOpenUI
@onready var eyes_closed_ui: Control = $EyesClosedUI
@onready var shower_progress: TextureProgressBar = $EyesClosedUI/ShowerProgress



func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta):
	if GameManager.GameOver == true:
		MusicManager.fondoSceneStop()
		get_tree().quit()

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENS))
		head.rotate_x(deg_to_rad(-event.relative.y * MOUSE_SENS))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-32), deg_to_rad(60))


func _physics_process(_delta):
	if %InteractRay.is_colliding():
		#Global.canInteract = true
		var target = %InteractRay.get_collider()
		if Input.is_action_just_released("interact"):
			if target.is_in_group("window") and GameManager.WindowOpened == true:
				GameManager.WindowClosing = true
		if target.is_in_group("corridor") and GameManager.BoggartOn == true:
			GameManager.BoggartOn = false
			print("BYE BYE")
		#if target.is_in_group("Bath"):
			#eyes_open_ui.hide()
			#eyes_closed_ui.show()
		#else:
			#eyes_open_ui.show()
			#eyes_closed_ui.hide()
		#else:
			#Global.canInteract = false
		
