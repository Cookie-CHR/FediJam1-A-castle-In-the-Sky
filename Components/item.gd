extends Node2D
@export var type = ""
@export var level = 0
@export var price = 0

var bg_disabled = preload("res://Images/item_bg_disabled.png")

signal item_bought

# Called when the node enters the scene tree for the first time.
func _ready():
	$Image.texture = load("res://Images/items/"+type+"_"+str(level)+".png")
	$Label.text = str(price)
	init()
	
func init():	
	if General.money < price or \
		(type == "launcher" and General.launcher_lvl >= level) or \
		(type == "plane" and General.plane_lvl >= level) or \
		(type == "luck" and General.luck_lvl >= level):
		$Button.disabled = true
		
		if (type == "launcher" and General.launcher_lvl >= level) or \
		(type == "plane" and General.plane_lvl >= level) or \
		(type == "luck" and General.luck_lvl >= level):
			$Button.add_theme_font_size_override("font_size", 50)
			$Button.text = "Bought!"
		else:
			$Button.add_theme_font_size_override("font_size", 35)
			$Button.text = "Can't afford"
		$Background.texture = bg_disabled

func buy():
	General.money -= price
	if type == "launcher" : General.launcher_lvl = level
	if type == "plane" : General.plane_lvl = level
	if type == "luck" : General.luck_lvl = level
	$Button.disabled = true
	$Button.add_theme_font_size_override("font_size", 50)
	$Button.text = "Bought!"
	SoundManager.audio_play("money")
	
	emit_signal("item_bought")

