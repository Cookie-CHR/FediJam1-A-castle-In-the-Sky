extends Node

var level_scn = preload("res://scenes/main.tscn")

func _go_to_level(_num):
	SoundManager.change_music("Main");
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _go_to_shop():
	SoundManager.audio_play("tick");
	SoundManager.change_music("Shop");
	get_tree().change_scene_to_file("res://scenes/shop.tscn")
	
func _go_to_credits():
	SoundManager.audio_play("tick");
	SoundManager.change_music("Title");
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
	
func _go_to_menu():
	SoundManager.audio_play("tick");
	SoundManager.change_music("Title");
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
func _go_to_map():
	SoundManager.change_music("Title");
	get_tree().change_scene_to_file("res://scenes/map.tscn")
	
func _play():
	SoundManager.audio_play("tick");
	SoundManager.change_music("Main");
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
