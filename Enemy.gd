extends KinematicBody2D


# Declare member variables here. Examples:
var velocity = Vector2()
export var speed = 100
var startPos = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if(startPos == 0):
		velocity = Vector2(rand_range(-0.5, 0.5), rand_range(0, 1))
	if(startPos == 1):
		velocity = Vector2(rand_range(-1, 0), rand_range(-0.5, 0.5))
	if(startPos == 2):
		velocity = Vector2(rand_range(-0.5, 0.5), rand_range(-1, 0))
	if(startPos == 3):
		velocity = Vector2(rand_range(0, 1), rand_range(-0.5, 0.5))
	velocity = velocity.normalized() * speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(velocity * delta)
