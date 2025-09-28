extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -200.0
var has_direction = false

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	var void_area = get_node("../Area2D")   # Path to Area2D
	void_area.connect("body_entered", Callable(self, "_on_void_entered"))

func _physics_process(delta: float) -> void:
	# Movement
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("Left", "Right")
	if direction != 0:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = direction < 0
		if !has_direction:
			has_direction = true
			$AnimatedSprite2D.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if has_direction:
			has_direction = false
			$AnimatedSprite2D.play("default")

	move_and_slide()

func _on_void_entered(body: PhysicsBody2D) -> void:
	if body == self:
		print("YO IM DEAD")
