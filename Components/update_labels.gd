extends Camera2D

signal still
var banner_scn = preload("res://Components/Banner.tscn")
var banner_here = false
var timer_started = false

var total_time = 0
var total_distance = 0

func _ready():
	still.connect(put_banner)

func timer_start():
	if !timer_started:
		$Timer.start()
		timer_started = true

	
# Called when the node enters the scene tree for the first time.
func update_labels(velocity, distance):
	if ! banner_here:
		total_distance = distance
		$Distance.text = "Distance: %.2f m" %(distance/1000)
		var speed = sqrt(velocity.x*velocity.x + velocity.y*velocity.y)
		$Velocity.text = "Velocity: %d km/h" %(speed/100)
		$TextureProgressBar.value = distance/1000

func put_banner():
	if(!banner_here):
		var banner = banner_scn.instantiate()
		add_child(banner)
		banner_here = true;
		banner.adjust_labels(total_distance/1000, total_time)

func update_time():
	total_time +=1
