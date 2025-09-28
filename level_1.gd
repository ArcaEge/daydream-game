extends Node2D

var lives = 10
var level2 = preload("res://level2.tscn")


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
		lives = 10
		print("UR COOKED")


func _on_transition_area_entered(body: PhysicsBody2D) -> void:
	print("WOW YOU PASSED - NOW FACE THE NEXT LEVEL")
	get_tree().change_scene_to_packed(level2)
