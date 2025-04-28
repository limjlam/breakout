extends Area2D

@onready var ball: CharacterBody2D = %Ball
@onready var game_manager: Node = %GameManager
@onready var timer: Timer = $Timer
@onready var sfx_lost: AudioStreamPlayer2D = $sfx_lost

func _on_body_entered(body: Node2D) -> void:
	sfx_lost.play()
	game_manager.deduct_life()
	timer.start()

func _on_timer_timeout() -> void:
	ball.reset_ball()
	timer.stop()
