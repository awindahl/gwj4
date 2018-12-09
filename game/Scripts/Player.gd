extends KinematicBody

var Velocity = Vector3()
var temp = 0
var CanMove = true
var Score = 0
onready var Sack = $Elfguy/Armature/Sack
const SPEED = 10
const TYPE = "PLAYER"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	
	if not (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down")):
		Velocity = Vector3(0,0,0)
	
	
	if not get_node("Elfguy/AnimationPlayer").is_playing():
		CanMove = true
	if CanMove:
		_movement()
	_rotate()
	if Velocity.x == 0 and Velocity.z == 0 and temp == 0 and CanMove:
		temp = 1 
		$Elfguy/AnimationPlayer.play("idleanim")
	if CanMove:
		Velocity = move_and_slide(Velocity)

func _movement():
	if Input.is_action_pressed("ui_left"):
		Velocity.x = SPEED
		_walkanimation()
	if Input.is_action_just_released("ui_left"):
		Velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		Velocity.x = -SPEED
		_walkanimation()
	if Input.is_action_just_released("ui_right"):
		Velocity.x = 0
	if Input.is_action_pressed("ui_up"):
		Velocity.z = SPEED
		_walkanimation()
	if Input.is_action_just_released("ui_up"):
		Velocity.z = 0
	if Input.is_action_pressed("ui_down"):
		Velocity.z = -SPEED
		_walkanimation()
	if Input.is_action_just_released("ui_down"):
		Velocity.z = 0

func _rotate():
	if Velocity.x > 0:
		rotation_degrees.y = 90
	if Velocity.x < 0:
		rotation_degrees.y = -90
	if Velocity.z > 0:
		rotation_degrees.y = 0
	if Velocity.z < 0:
		rotation_degrees.y = 180
	if Velocity.x > 0 and Velocity.z > 0:
		rotation_degrees.y = 45
	if Velocity.x < 0 and Velocity.z > 0:
		rotation_degrees.y = -45
	if Velocity.x > 0 and Velocity.z < 0:
		rotation_degrees.y = 135
	if Velocity.x < 0 and Velocity.z < 0:
		rotation_degrees.y = -135

func _walkanimation():
	if temp == 1:
		temp = 0
		$Elfguy/AnimationPlayer.play("walk-loop")
