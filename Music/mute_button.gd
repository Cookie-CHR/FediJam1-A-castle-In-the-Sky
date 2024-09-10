extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		change_icon(child)
		child.connect("pressed", mute_unmute.bind(child))

func mute_unmute(child):
	if child.name=="Audio":
		SoundManager.audio_mute_unmute()
	else:
		SoundManager.music_mute_unmute()
	change_icon(child)

func change_icon(child):
	if child.name=="Audio":
		if SoundManager.audio_mute:
			child.icon = (load("res://Images/sound_off.png"))
		else:
			child.icon = (load("res://Images/sound_on.png"))
	else:
		if SoundManager.music_mute:
			child.icon = (load("res://Images/music_off.png"))
		else:
			child.icon = (load("res://Images/music_on.png"))
