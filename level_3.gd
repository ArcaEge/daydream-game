extends Node2D

var lives = 10
var current_level = preload("res://level3.tscn")
var next_level = preload("res://level3.tscn")


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
		get_tree().change_scene_to_packed(current_level)
		print("UR COOKED")
	$Player/Lives.text = "lives: " + str(lives)


func _on_transition_area_entered(body: PhysicsBody2D) -> void:
	print("WOW YOU PASSED - NOW FACE THE NEXT LEVEL")
	get_tree().change_scene_to_packed(next_level)
