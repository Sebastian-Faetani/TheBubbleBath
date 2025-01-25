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

@onready var eye_progress: TextureProgressBar = $EyesOpenUI/EyeProgress
@onready var animation_player: AnimationPlayer = $EyesOpenUI/AnimationPlayer

var eye_timer_duration: float = 6.0
var eye_timer_elapsed: float = 0.00
var eye_speed_multiplier: float = 1.0

var shower_timer_duration: float = 60.0
var shower_timer_elapsed: float = 0.00
var shower_speed_multiplier: float = 1.0

#signal shower_timer_updated(current_time: float, progress: float)


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	shower_progress.max_value = shower_timer_duration
	eye_progress.max_value = eye_timer_duration

func _process(delta):
	if GameManager.GameOver == true:
		EndGame()
	
	if eyes_closed_ui.visible == true:
		SoundManager.Wash()
	elif eyes_open_ui.visible == true:
		SoundManager.StopWash()
	
	if shower_timer_elapsed < shower_timer_duration and eyes_closed_ui.visible == true:
		shower_timer_elapsed += delta * shower_speed_multiplier
		shower_timer_elapsed = clamp(shower_timer_elapsed, 0, shower_timer_duration)
		
		shower_progress.value = shower_timer_elapsed

	if shower_timer_elapsed >= shower_timer_duration:
		EndGame()
	
	if eye_timer_elapsed < eye_timer_duration and eyes_open_ui.visible == true:
		eye_timer_elapsed += delta * eye_speed_multiplier
		eye_timer_elapsed = clamp(eye_timer_elapsed, 0, eye_timer_duration)
		
		eye_progress.value = eye_timer_elapsed
	
	if eye_timer_elapsed >= eye_timer_duration:
		MyEyes()

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * MOUSE_SENS))
		head.rotate_x(deg_to_rad(-event.relative.y * MOUSE_SENS))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-32), deg_to_rad(60))


func _physics_process(_delta):
	if interact_ray.is_colliding():
		var target = interact_ray.get_collider()
		if target and target.is_in_group("Bath"):
			eye_timer_elapsed = 0.0
			animation_player.stop()
			GameManager.animStop = false
			GameManager.EyesHurty = false
			eyes_open_ui.hide()
			eyes_closed_ui.show()
		else:
			eyes_open_ui.show()
			eyes_closed_ui.hide()
	else:
		if GameManager.animStop == false:
			animation_player.play("EyeRed")
		eyes_open_ui.show()
		eyes_closed_ui.hide()

	# Handle interact actions separately
	if interact_ray.is_colliding() and Input.is_action_just_released("interact"):
		var target = interact_ray.get_collider()
		if target:
			if target.is_in_group("window") and GameManager.WindowOpened == true and GameManager.EyesHurty == false:
				GameManager.WindowClosing = true
			if target.is_in_group("corridor") and GameManager.BoggartOn == true and GameManager.EyesHurty == false:
				GameManager.BoggartOn = false
				GameManager.BoggartSprite1 = false
				GameManager.BoggartSprite2 = false
				GameManager.BoggartSprite3 = false
				GameManager.boggartStep = false
				print("BYE BYE")
	
func EndGame():
	MusicManager.fondoSceneStop()
	if GameManager.GameWon == true:
		get_tree().change_scene_to_file("res://Scenes/win_scene.tscn")
	elif GameManager.GameOver == true:
		get_tree().change_scene_to_file("res://Scenes/lose_scene.tscn")

func MyEyes():
	GameManager.EyesHurty = true

func freezeAnim():
	GameManager.animStop = true
	animation_player.pause()
