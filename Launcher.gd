extends Node2D

signal fire

var l1 = preload("res://Images/launcher_1.png")
var l2 = preload("res://Images/launcher_2.png")
var l3 = preload("res://Images/launcher_3.png")

func _ready():
	$Sprite2D.texture = l1
	match General.launcher_lvl:
		1: $Sprite2D.texture = l1
		2: $Sprite2D.texture = l2
		2: $Sprite2D.texture = l3
		_: pass
func _process(_delta):
	$Arrow.look_at(get_global_mouse_position())
	
func _input(event):
	if event is InputEventMouseButton:
		SoundManager.audio_play("boing");
		emit_signal("fire")
