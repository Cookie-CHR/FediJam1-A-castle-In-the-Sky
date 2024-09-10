extends Node2D
@export var type = ""
@export var level = 0
@export var price = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Image.texture = load("res://Images/items/"+type+"_"+str(level)+".png")
	$Label.text = str(price)
	
	if General.money < price or \
		(type == "launcher" and General.launcher_lvl >= level) or \
		(type == "plane" and General.plane_lvl >= level) or \
		(type == "luck" and General.luck_lvl >= level):
		$Button.disabled = true

func buy():
	print("buy")
	General.money -= price
	if type == "launcher" : General.launcher_lvl = level
	if type == "plane" : General.plane_lvl = level
	if type == "luck" : General.luck_lvl = level
	$Button.disabled = true
	SoundManager.audio_play("money")
