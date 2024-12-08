extends CharacterBody2D

@export var gravity: float = 750
@export var run_speed: float = 150
@export var jump_speed: float = -300

enum State {IDLE, RUN, JUMP, HURT, DEAD}
var state: int = State.IDLE

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
		State.DEAD:
			hide()
#
#func _physics_process(delta: float) -> void:
	## Example movement logic
	#velocity.y += gravity * delta
	#get_input()
	#move_and_slide()
	#
#func get_input() -> void:
	## Input handling code here
	#pass
