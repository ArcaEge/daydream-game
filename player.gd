extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -200.0

var has_direction = false

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
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
	
