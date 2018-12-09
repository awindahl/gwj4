extends KinematicBody

var number
var score
var sprite
var movecounter = 0

func _ready():
	randomize()
	number = randi() % 4 + 1
	
	match number:
		1:
			score = 1
		2:
			score = 1
		3:
			score = 1
		4:
			score = 1
			

func _process(delta):
	if movecounter < 340:
		movecounter += 1
		move_and_slide(Vector3(0,0,1))
	else:
		$Area/CollisionShape.disabled = false

func _on_Area_body_entered(body):
	if body.get("TYPE") == "PLAYER":
		var bodyScore = body.Score
		if bodyScore < 4:
			body.temp = 1
			body.get_node("Elfguy/AnimationPlayer").play("pickupanim")
			body.get_node("Elfguy/Armature/Sack").scale += Vector3(.3,.08,.2)
			body.Score += score
			body.CanMove = false
			get_parent().HasSpawned = false
			queue_free()