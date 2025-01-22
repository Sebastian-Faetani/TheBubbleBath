extends Node
@onready var button_click: AudioStreamPlayer = $ButtonClick

func ButtonClicked():
	button_click.play()
