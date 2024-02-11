extends Area2D

var direction : Vector2
var speed : int = 500

var sprite_rotation_initialized : bool = false

func _process(delta):
	position += speed * direction * delta
	if direction.x != 0 && !sprite_rotation_initialized :
		$Sprite2D.flip_h = direction.x < 0
		sprite_rotation_initialized = true
	#TODO place this logic into _ready if possible?

func _on_timer_timeout():
	queue_free()

func _on_body_entered(body):
	if body.name == "World":
		queue_free()
	else: 
		if body.alive:
			body.die()
			queue_free()
