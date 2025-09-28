extends Node2D

var lives = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player/Lives.text = "lives: " + str(lives)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_death() -> void:
	lives -= 1
	if lives > 0:
		print("IMAGINE, SKILL ISSUE")
	else:
		lives = 10
		print("UR COOKED")
	$Player/Lives.text = "lives: " + str(lives)
