extends Node3D

@onready var animated_sprite_3d: AnimatedSprite3D = $AnimatedSprite3D

var timer_duration: float = 180.0
var timer_elapsed: float = 0.00
var speed_multiplier: float = 1.0

signal timer_updated(current_time: float, progress: float)

func _process(delta: float) -> void:
	if GameManager.WindowOpened == true:
		speed_multiplier = 2.0
	else:
		speed_multiplier = 1.0
	
	if timer_elapsed < timer_duration:
		timer_elapsed += delta * speed_multiplier
		timer_elapsed = clamp(timer_elapsed, 0, timer_duration)
		
		emit_signal("timer_updated", timer_elapsed, timer_elapsed / timer_duration)
		
		_handle_animation(timer_elapsed / timer_duration)
		

func _handle_animation(progress: float) -> void:
	if progress < 0.2:
		animated_sprite_3d.play("FullFirst")
	elif progress < 0.4 and progress > 0.2: 
		animated_sprite_3d.play("Second")
	elif progress < 0.6 and progress > 0.4:
		animated_sprite_3d.play("Third")
	elif progress < 0.8 and progress > 0.6:
		animated_sprite_3d.play("Fourth")
	elif progress > 0.8 and progress < 1:
		animated_sprite_3d.play("Fifth")
	elif progress >= 1:
		animated_sprite_3d.play("TheEnd")
		GameManager.GameOver = true
