extends AnimatedSprite2D

var entered : bool
var speed : int = 100
var direction : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	var screen_rect = get_viewport_rect()
	entered = false
	var dist = screen_rect.get_center() - position
	if abs(dist.x) > abs(dist.y):
		direction.x = dist.x
		direction.y = 0
	else: 
		direction.x = 0
		direction.y = dist.y
		
func _physics_process(_delta):
	var velocity = direction * speed
	move_and_slide()
