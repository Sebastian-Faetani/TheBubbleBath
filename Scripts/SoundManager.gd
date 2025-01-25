extends Node
@onready var button_click: AudioStreamPlayer = $ButtonClick
@onready var door_open: AudioStreamPlayer = $DoorOpen
@onready var window_open_and_closed: AudioStreamPlayer = $WindowOpenAndClosed
@onready var hair_wash: AudioStreamPlayer = $HairWash
@onready var steps: AudioStreamPlayer = $Steps

func ButtonClicked():
	button_click.play()
		

func WindowMove():
	window_open_and_closed.play()

func Wash():
	hair_wash.play()

func StopWash():
	hair_wash.stop()
