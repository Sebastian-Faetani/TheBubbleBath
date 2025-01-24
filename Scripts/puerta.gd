extends MeshInstance3D

@onready var puerta: MeshInstance3D = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree

@onready var playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]


func _process(_delta: float) -> void:
	if GameManager.DoorOpening == true and GameManager.DoorOpen == false:
		playback.travel("PliOpen")
		print("DooruNSTUCK")
		GameManager.WindowOpening = false
		GameManager.DoorOpen = true
