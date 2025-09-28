extends Node2D

var lives = 10

signal complete_death

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_death() -> void:
	if lives > 0:
		lives -= 1
		print("IMAGINE, SKILL ISSUE")
	else:
		print("UR COOKED")
