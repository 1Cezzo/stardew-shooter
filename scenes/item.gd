extends Area2D

var item_type : int

var yellow_potion = preload("res://assets/icons/PotionYellow.png")
var red_potion = preload("res://assets/icons/PotionRed.png")
var blue_potion = preload("res://assets/icons/PotionBlue.png")
var textures = [yellow_potion, red_potion, blue_potion]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = textures[item_type]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
