extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var preEnemies = []
var enemies = []
var enemiesToFree = []

var score = 0
var preCoin
var coin

func _on_coin_touch(body):
	if body.name == "Player":
		score += 1
		coin.position = Vector2(rand_range(64, 960), rand_range(64, 544))
		$CanvasLayer/Panel/Score.text = str(score)

func instance_enemy(enemy):
	var choice = randi()%4
	if(choice == 0):
		enemy.position = Vector2(rand_range(-32, 1056), -32)
	if(choice == 1):
		enemy.position = Vector2(1056, rand_range(-32, 640))
	if(choice == 2):
		enemy.position = Vector2(rand_range(-32, 1056), 640)
	if(choice == 3):
		enemy.position = Vector2(-32, rand_range(-32, 640))
	enemy.startPos = choice
	add_child(enemy)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for i in range(10):
		preEnemies.append(preload("res://Enemy.tscn"))
	for i in range(10):
		enemies.append(preEnemies[i].instance())
		instance_enemy(enemies[i])
	
	preCoin = preload("res://Coin.tscn")
	coin = preCoin.instance()
	coin.position = Vector2(rand_range(64, 960), rand_range(64, 544))
	add_child(coin)
	$CanvasLayer/GameOver.visible = false
	$CanvasLayer/Pause.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(enemies.size()):
		if(is_instance_valid(enemies[i]) and (enemies[i].position.x < -32 or enemies[i].position.x > 1056 or enemies[i].position.y < -32 or enemies[i].position.y > 640)):
			enemiesToFree.append(i)
		if(not is_instance_valid(enemies[i])):
			preEnemies[i] = load("res://Enemy.tscn")
			enemies[i] = preEnemies[i].instance()
			instance_enemy(enemies[i])
	for i in enemiesToFree:
		enemies[i].queue_free()
	enemiesToFree.clear()
	if(Input.is_action_just_pressed("pause")):
		$CanvasLayer/Pause.visible = true
		get_tree().paused = true
	
