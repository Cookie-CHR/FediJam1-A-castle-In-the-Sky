extends Node


func go_to_level(num):
	get_tree().change_scene("res://scenes/level.tscn")

func go_to_menu():
	get_tree().change_scene("res://scenes/menu.tscn")

func go_to_credits():
	get_tree().change_scene("res://scenes/credits.tscn")

func go_to_level_map():
	get_tree().change_scene("res://scenes/level_map.tscn")
