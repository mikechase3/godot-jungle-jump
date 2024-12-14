extends CharacterBody2D

signal life_changed(life: int)
signal died

@export var gravity: float = 750
@export var run_speed: float = 150
@export var jump_speed: float = -300

@export var life: int = 3:
	set(value):
		life = value
		life_changed.emit(life)
		if life <= 0:
			change_state(State.DEAD)

enum State {IDLE, RUN, JUMP, HURT, DEAD}  # A NAMED state, requires State.IDLE to call.
var state: int = State.IDLE


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta  # Applies gravity
	get_input()
	move_and_slide()  # takes velocity as an input tho its not passed in.
		
	# Detect when a jump ends (move_and_slide() updates is_on_floor())
	if state == State.JUMP and is_on_floor():
		change_state(State.IDLE)
		
	if state == State.HURT:
		return   # A timer starts in change_state for hurt.
	
	# get_slide_collision_count() returns the number of times the body
	# collided and changed direction during the last call to move and slide ().
	for i in range(get_slide_collision_count()):
		var collision: KinematicCollision2D = get_slide_collision(i)
		var collider: Object = collision.get_collider()
		if collider.is_in_group("danger"):
			hurt()  # self.hurt
				
		
func _ready() -> void:
	change_state(State.IDLE)

func change_state(new_state: int) -> void:
	state = new_state
	match state:
		State.IDLE:
			$AnimationPlayer.play("idle")
		State.RUN:
			$AnimationPlayer.play("run")
		State.JUMP:
			$AnimationPlayer.play("jump_up")
		State.HURT:
			$AnimationPlayer.play("hurt")
			velocity.y = -200
			velocity.x = -100 * sign(velocity.x)
			life -= 1
			# Uses await to create a short delay of 0.5 seconds
			await get_tree().create_timer(0.5).timeout
			change_state(State.IDLE)
		State.DEAD:
			hide()
			


func get_input() -> void:
	'''
	Handles input and makes calls to change player's state
	* Input manager reports what user holds down.
	* Flips sprite if running left or right
	* Manages transitions of state machine, calling change_state
	'''
	
	if state == State.HURT:
		return
	
	var right: bool = Input.is_action_pressed("right")
	var left: bool = Input.is_action_pressed("left")
	var jump: bool = Input.is_action_pressed("jump")
	
	# Movement Occurs in all states?
	velocity.x = 0
	if right:
		velocity.x += run_speed
		$Sprite2D.flip_h = false
		
	if left:
		velocity.x = velocity.x - run_speed
		$Sprite2D.flip_h = true
		

	if jump and is_on_floor():
		change_state(State.JUMP)
		velocity.y = jump_speed
		
	if state == State.IDLE and velocity.x != 0:  # Named enum is different than notes.
		change_state(State.RUN)
		
	if state == State.RUN and velocity.x == 0:
		change_state(State.IDLE)
		
	if state in [State.IDLE, State.RUN] and !is_on_floor():
		change_state(State.JUMP)
		
	# Handle if we're falling.
	if state == State.JUMP and velocity.y > 0:
		$AnimationPlayer.play("jump_down")
		

	

func hurt() -> void:
	if state != State.HURT:
		change_state(State.HURT)



	
	
func reset(_position: Vector2) -> void: 
	position = _position
	show()
	change_state(State.IDLE)
	life = 3  # Reset life
