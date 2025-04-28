extends CharacterBody2D

const SPEED = 350.0

@onready var game_manager: Node = %GameManager
@onready var sfx_ball: AudioStreamPlayer2D = $sfx_ball
@onready var sfx_score: AudioStreamPlayer2D = $sfx_score

func _ready():
	velocity = Vector2(0, -200).normalized() * SPEED

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		sfx_ball.play()
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
			velocity *= 1.01
			sfx_score.play()
			game_manager.add_points()

func reset_ball():
	if %GameManager.lives > 0:
		position = Vector2(575,525)
		velocity = Vector2(0, -200,).normalized() * SPEED
	else:
		pass
