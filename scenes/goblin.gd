extends CharacterBody2D

@onready var main = get_node("/root/Main")
@onready var player = get_node("/root/Main/Player")

var item_scene := preload("res://scenes/item.tscn")

var entered : bool
var speed : int = 100
var direction : Vector2
var alive : bool

signal hit_player

# Called when the node enters the scene tree for the first time.
func _ready():
	var screen_rect = get_viewport_rect()
	alive = true
	entered = false
	var dist = screen_rect.get_center() - position
	if abs(dist.x) > abs(dist.y):
		direction.x = dist.x
		direction.y = 0
	else: 
		direction.x = 0
		direction.y = dist.y

func _physics_process(_delta):
	if alive:
		$AnimatedSprite2D.animation = "run"
		if entered:
			direction = (player.position - position)
		direction = direction.normalized()
		velocity = direction * speed
		move_and_slide()

		if velocity.x != 0:
			$AnimatedSprite2D.flip_h = velocity.x < 0
	else: 
		pass

func die():
	alive = false
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D.animation = "dead"
	drop_item()

func drop_item():
	var item = item_scene.instantiate()
	item.position = position
	main.call_deferred("add_child", item)
	item.add_to_group("items")
	item.item_type = randi_range(0, 2)

func _on_entrance_timer_timeout():
	entered = true

func _on_area_2d_body_entered(_body):
	hit_player.emit()
