extends Node

var max_enemies : int
var wave : int
var lives : int

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	$GameOver/Button.pressed.connect(new_game)

func new_game():
	max_enemies = 10
	wave = 1
	lives = 5
	$Player.reset()
	get_tree().call_group("enemies", "queue_free")
	get_tree().call_group("bullets", "queue_free")
	get_tree().call_group("items", "queue_free")
	$HUD/LivesLabel.text = "X " + str(lives)
	$HUD/WaveLabel.text = "WAVE: " + str(wave)
	$HUD/EnemiesLabel.text = "X " + str(max_enemies)
	$GameOver.hide()
	get_tree().paused = true
	$RestartTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_enemy_spawner_hit_p():
	lives -= 1
	print("Hit player")
	$HUD/LivesLabel.text = "X " + str(lives)
	if lives <= 0:
		get_tree().paused = true
		$GameOver/WavesSurvivedLabel.text = "WAVES SURVIED: " + str(wave - 1)
		$GameOver.show()

func _on_restart_timer_timeout():
	get_tree().paused = false
