extends TileMap

var rng =RandomNumberGenerator.new()

func _ready():
	#randomize background
	rng.randomize()
	
	for x in range(0, 16):
		for y in range(0, 10):
			set_cell(0, Vector2(x,y), 0, Vector2(rng.randi_range(0,3), rng.randi_range(0,3)))


func _process(_delta):
	#change one tile from time to time, randomly
	for x in range(0, 16):
		for y in range(0, 10):
			if(rng.randi_range(0,200)==0):
				set_cell(0, Vector2(x,y), 0, Vector2(rng.randi_range(0,3), rng.randi_range(0,3)))
