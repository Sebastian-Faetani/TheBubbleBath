extends Node

var BoggartOn : bool
var WindowOpened : bool
var WindowOpening : bool
var WindowClosing : bool
var DoorOpening : bool
var DoorOpen : bool

func _ready() -> void:
	BoggartOn = false
	WindowOpened = false
	WindowOpening = false
	WindowClosing = false
	DoorOpening = false
	DoorOpen = false
