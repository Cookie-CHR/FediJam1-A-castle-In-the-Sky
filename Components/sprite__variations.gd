extends Sprite2D

var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(1-rng.randf_range(0,0.1),1-rng.randf_range(0,0.1),1-rng.randf_range(0,0.1))
	rotation_degrees = randf_range(-360,360)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
