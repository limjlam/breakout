extends StaticBody2D

@onready var sfx_score: AudioStreamPlayer2D = $sfx_score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hit():
	$Sprite2D.visible = false
	$CollisionShape2D.disabled = true
	queue_free()
