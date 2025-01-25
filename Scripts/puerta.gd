extends MeshInstance3D

@onready var puerta: MeshInstance3D = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

@onready var playback: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]


func _process(_delta: float) -> void:
	if GameManager.DoorOpening == true and GameManager.DoorOpen == false:
		audio_stream_player_3d.play()
		print("Sound stuckDoor")
		playback.travel("PliOpen")
		GameManager.WindowOpening = false
		GameManager.DoorOpen = true
