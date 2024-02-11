extends Area2D

@onready var main = get_node("/root/Main")
@onready var lives_label = get_node("/root/Main/HUD/LivesLabel")

var item_type : int

var yellow_potion = preload("res://assets/icons/PotionYellow.png")
var red_potion = preload("res://assets/icons/PotionRed.png")
var blue_potion = preload("res://assets/icons/PotionBlue.png")
var textures = [yellow_potion, red_potion, blue_potion]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = textures[item_type]

func _on_body_entered(body):
	if item_type == 0:
		body.boost()
		queue_free()
	elif item_type == 1:
		main.lives += 1
		queue_free()
		lives_label.text = "X: " + str(main.lives)
	elif item_type == 2:
		body.quick_fire()
		queue_free()
