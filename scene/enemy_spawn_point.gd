extends Marker2D
# Path to the enemies folder
const ENEMIES_FOLDER = "res://scene/enemies/"

# List to hold enemy scenes
var enemy_scenes = []

func _ready() -> void:
	BattleTracker.spawnEnemy.connect(spawnEnemy)
	# Load all enemy scenes into the list
	var dir = DirAccess.open(ENEMIES_FOLDER)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".tscn"):
				var scene_path = ENEMIES_FOLDER + file_name
				enemy_scenes.append(load(scene_path))
			file_name = dir.get_next()
		dir.list_dir_end()

	# Example: Spawn a random enemy
	print(enemy_scenes)
	print(enemy_scenes.size())
	spawn_random_enemy()


func spawnEnemy():
	spawn_random_enemy()

func spawn_random_enemy():
	# Select a random enemy scene
	var random_scene = enemy_scenes[randi_range(0, enemy_scenes.size() - 1)]

	# Instantiate the scene
	var enemy_instance = random_scene.instantiate()

	# Set a random position along the x-axis (adjust as needed)
	print("Enemy spawned: ", enemy_instance)
	# Add the enemy to the scene
	add_child(enemy_instance)
