extends Node3D

@onready var player: CharacterBody3D = $Player
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var window_timer: Timer = $WindowTimer
@onready var boggart_timer: Timer = $BoggartTimer

@export var windowTime = randf_range(10.0, 30.0)
@export var boggarTime = randf_range(10.0, 30.0)

@onready var playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]
@onready var boggart_pos_1: Sprite3D = $Boggart/BoggartPos1
@onready var boggart_pos_2: Sprite3D = $Boggart/BoggartPos2
@onready var boggart_pos_3: Sprite3D = $Boggart/BoggartPos3

#Boggart attack time
var timer_duration: float = 180.0
var timer_elapsed: float = 0.00
var speed_multiplier: float = 1.0

signal timer_updated(current_time: float, progress: float)

func _ready() -> void:
	window_timer.start(windowTime)
	boggart_timer.start(boggarTime)

func _process(delta: float) -> void:
	if GameManager.BoggartOn == true and GameManager.BoggartSprite1 == true:
		boggart_pos_1.show()
	elif GameManager.BoggartOn == true and GameManager.BoggartSprite2 == true:
		boggart_pos_2.show()
		boggart_pos_1.hide()
	elif GameManager.BoggartOn == true and GameManager.BoggartSprite3 == true:
		boggart_pos_3.show()
		boggart_pos_2.hide()

	if GameManager.BoggartOn == true and timer_elapsed < timer_duration:
		timer_elapsed += delta * speed_multiplier
		timer_elapsed = clamp(timer_elapsed, 0, timer_duration)
		
		emit_signal("timer_updated", timer_elapsed, timer_elapsed / timer_duration)
		
		_handle_boggart(timer_elapsed / timer_duration)
		

func _handle_boggart(progress: float) -> void:
	if progress < 0.33:
		GameManager.BoggartSprite1 = true
	elif progress < 0.66 and progress > 0.33: 
		GameManager.BoggartSprite2 = true
		GameManager.BoggartSprite1 = false
		print("66%")
	elif progress < 0.8 and progress > 0.66:
		GameManager.BoggartSprite3 = true
		GameManager.BoggartSprite2 = false
		print("80%")
	elif progress >= 1:
		GameManager.GameOver = true


func _physics_process(delta: float) -> void:
	if GameManager.WindowOpening == true and GameManager.WindowOpened == false:
		playback.travel("WindowOpening")
		GameManager.WindowOpening = false
		GameManager.WindowOpened = true
		
	if GameManager.WindowClosing == true and GameManager.WindowOpened == true:
		playback.travel("WindowClosing")
		GameManager.WindowClosing = false
		GameManager.WindowOpened = false
		
	if GameManager.DoorOpening == true and GameManager.DoorOpen == false:
		GameManager.DoorOpen = true
		playback.travel("PliOpen")
		


func _on_window_timer_timeout() -> void:
	if GameManager.WindowOpened == false:
		GameManager.WindowOpening = true
	window_timer.start()
	print("Window opened")


func _on_boggart_timer_timeout() -> void:
	if GameManager.DoorOpen == false:
		GameManager.DoorOpening = true
	if GameManager.BoggartOn == false:
		GameManager.BoggartOn = true
	boggart_timer.start()
	print("Boggart in the base")
