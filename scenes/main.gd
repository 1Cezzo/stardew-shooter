extends Node

var max_enemies : int
var wave : int
var lives : int

# Called when the node enters the scene tree for the first time.
func _ready():
	max_enemies = 10
	wave = 1
	lives = 5
	$HUD/LivesLabel.text = "X " + str(lives)
	$HUD/WaveLabel.text = "WAVE: " + str(wave)
	$HUD/EnemiesLabel.text = "X " + str(max_enemies)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_enemy_spawner_hit_p():
	lives -= 1
	print("Hit player")
	$HUD/LivesLabel.text = "X " + str(lives)
