extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Play.pressed.connect(LevelManager._play)
	$Money.text = str(General.money)
	$Day/Label.text = str(General.day)




func _on_item_bought():
	$Money.text = str(General.money)
	for child in get_children():
		if child.name.find("launcher") != -1 or \
		child.name.find("plane") != -1 or \
		child.name.find("luck") != -1:
			child.init()

