extends KinematicBody2D

# Declare member variables here. Examples:
var velocity = Vector2()
export var speed = 100

func handle_input():
	velocity = Vector2(0, 0)
	if(Input.is_action_pressed("up")):
		velocity.y -= 1
	if(Input.is_action_pressed("down")):
		velocity.y += 1
	if(Input.is_action_pressed("left")):
		velocity.x -= 1
	if(Input.is_action_pressed("right")):
		velocity.x += 1
	velocity = velocity.normalized() * speed

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_input()
	var collision = move_and_collide(velocity * delta)
	if collision:
		$".."/CanvasLayer/GameOver.visible = true
		$".."/CanvasLayer/GameOver/ScoreText.text = "Score: " + str($"..".score)
		get_tree().paused = true
