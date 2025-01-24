extends Node
@onready var button_click: AudioStreamPlayer = $ButtonClick
@onready var ventana: AudioStreamPlayer = $Ventana
@onready var fondo_menu: AudioStreamPlayer = $FondoMenu

func ButtonClicked():
	button_click.play()
		
