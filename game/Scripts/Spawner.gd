extends Spatial

var Item = preload("res://Scenes/Item.tscn")
var HasSpawned = false
var currSpawn

func _process(delta):
	if !HasSpawned:
		print("Spawning")
		HasSpawned = true
		var Spawn1 = Item.instance()
		add_child(Spawn1)
