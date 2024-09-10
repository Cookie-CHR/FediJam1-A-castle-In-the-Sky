extends Node

var music_mute = false
var audio_mute = false

var musics = {  
	"Title":  "res://Music/Music/Porch Swing Days - faster.mp3",\
	"Main":   "res://Music/Music/Sunshine A.mp3",\
	"Shop":   "res://Music/Music/Cloud Dancer.mp3"
}

var curr_music = musics["Title"]

func audio_mute_unmute():
	audio_mute = not audio_mute

func mute_unmute():
	if (music_mute):
		music_mute = false
		MusicPlayer.play()
	else:
		music_mute = true
		MusicPlayer.stop()


func change_music(key):
	if(not music_mute):
		if key in musics.keys():
			var new_music = musics[key]
			if curr_music != new_music:
				curr_music = new_music
				MusicPlayer.stop()
				MusicPlayer.set_stream(load(new_music))
				MusicPlayer.play()
	


func audio_play(sound):
	if(not audio_mute):
		AudioPlayer.stream = load("res://Music/Sounds/"+sound+".mp3")
		AudioPlayer.play()
	
