extends Node

var money = 100
var launcher_lvl = 0
var plane_lvl = 0
var luck_lvl = 0
"""
var texture = {
	"rock": preload("res://Images/Rock.png"),
	"sun": preload("res://Images/Sun.png"),
	"ice": preload("res://Images/Ice.png"),
	"grass": preload("res://Images/Grass.png"),
	"black": preload("res://Images/BlackHole.png")
}

var name_ext = {
	"R": "rock",
	"G": "grass",
	"S": "sun",
	"I": "ice",
	"B": "black"
}


var planets_lvl = {
	"0": { "rock": 3, "sun": 5, "ice": 5, "grass": 0, "black": 0 },
	"1": { "rock": 3, "sun": 0, "ice": 0, "grass": 3, "black": 0 },
	"2": { "rock": 2, "sun": 2, "ice": 0, "grass": 4, "black": 0 },
	"3": { "rock": 5, "sun": 0, "ice": 0, "grass": 2, "black": 0 },
	"4": { "rock": 4, "sun": 3, "ice": 3, "grass": 0, "black": 0 },
	"5": { "rock": 1, "sun": 0, "ice": 0, "grass": 0, "black": 4 },
	"6": { "rock": 2, "sun": 1, "ice": 1, "grass": 6, "black": 1 },
	"7": { "rock": 5, "sun": 2, "ice": 2, "grass": 4, "black": 4 },
	"8": { "rock": 2, "sun": 2, "ice": 2, "grass": 2, "black": 2 },
}
var map_lvl = {
	"0": [["O", "-", "-", "-", "O"],
		["O", "-", "B", "B", "O"],
		["O", "-", "-", "-", "O"],
		["O", "-", "S", "-", "O"],
		["O", "-", "-", "-", "O"],
		["O", "-", "I", "-", "O"],
		["O", "-", "-", "-", "O"]],
	
	"1": [["O", "-", "-", "-", "O"],
		["O", "-", "-", "-", "O"],
		["O", "-", "-", "-", "O"]],
	
	"2": [["O", "O", "-", "O", "O"],
		["O", "-", "-", "-", "O"],
		["O", "-", "-", "-", "O"],
		["O", "O", "-", "O", "O"]],
	
	"3": [["O", "-", "I", "-", "O"],
		["O", "-", "-", "-", "O"],
		["O", "-", "I", "-", "O"]],
	
	"4": [["O", "S", "-", "I", "O"],
		["O", "-", "-", "-", "O"],
		["O", "-", "-", "-", "O"],
		["O", "-", "-", "-", "O"]],
	
	"5": [["O", "-", "-", "-", "O"],
		["O", "-", "-", "-", "O"],
		["O", "-", "-", "-", "O"]],
	
	"6": [["-", "-", "-", "-"],
		["-", "-", "-", "-"],
		["-", "-", "B", "-"],
		["-", "-", "-", "-"]],
		
	"7": [["-", "-", "-", "-", "-"],
		["-", "-", "-", "-", "-"],
		["-", "-", "-", "-", "-"],
		["-", "-", "-", "-", "-"],
		["-", "-", "-", "-", "-"]],
		
	"8": [["-", "-", "-", "-", "-"],
		["-", "B", "-", "-", "-"],
		["-", "-", "-", "B", "-"],
		["-", "-", "-", "-", "-"]],
}

var label_lvl = {
	"0": "",
	"1": "Welcome! You must be our new empoyee, right?
	
		Here's a bunch of planets, just put them in any free space on the grid.",
	"2": "This guy ordered some suns, too.
	
		Rocky planets can stand the heat, but grassy planets don't. Put them far apart!",
	"3": "Same thing with icy planets: their cold aura might damage the grass.
	
		Oh, and of course I don't need to tell you not to put suns near icy planets, right?",
	"4": "Note from the developer: I should probably have made different effects for intersecting auras, but the thought alone made me want to drop the whole game. Enjoy your '?'.",
	"5": "Nasty black holes! Who would even order such things?
	
		These buggers suck anything that gets in their vicinity, so don't put anything close to them",
	"6": "Alright, tutorial's over. 
	
	Let's do something a little nastier, shall we?",
	"7": "",
	"8": "Last level. 
	
	I know, the game is short, but I'm already out of Ideas and it's been two weeks",
}
"""
