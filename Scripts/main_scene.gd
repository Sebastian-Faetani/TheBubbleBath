extends Node3D

@onready var player: CharacterBody3D = $Player
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree

@onready var playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]

func _physics_process(delta: float) -> void:
	if GameManager.WindowOpening == true:
		playback.travel("WindowOpening")
		GameManager.WindowOpening = false
		GameManager.WindowOpened = true
	if GameManager.WindowClosing == true:
		playback.travel("WindowClosing")
		GameManager.WindowClosing = false
		GameManager.WindowOpened = false
