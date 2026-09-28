extends SceneTree

var failures: Array[String] = []

func _init() -> void:
	call_deferred("_run")

func _check(condition: bool, message: String) -> void:
	if not condition:
		failures.append(message)

func _run() -> void:
	var packed := load("res://scenes/world/main.tscn") as PackedScene
	_check(packed != null, "Main scene must load.")
	if packed == null:
		_finish()
		return

	var world = packed.instantiate()
	root.add_child(world)
	await process_frame

	_check(world.hud != null, "HUD must be composed as a dedicated runtime component.")
	_check(world.world_renderer != null, "World renderer must be composed as a dedicated runtime component.")
	_check(int(world.world_renderer.asset_manifest.get("schema_version", 0)) == 1, "Visual asset manifest schema version must be 1.")
	_check(world.world_renderer.asset_textures.size() == 3, "Character art pass must load exactly three authored textures.")
	_check(world.world_renderer.asset_textures.has("player"), "Nick field sprite must load.")
	_check(world.world_renderer.asset_textures.has("mira"), "Mira field sprite must load.")
	_check(world.world_renderer.asset_textures.has("sora"), "Sora field sprite must load.")
	_check(world.points.size() == 9, "Content model must load nine interaction points.")
	_check(world.stage == 0, "Initial quest stage must be 0.")
	_check(world.inventory.size() == 0, "Initial inventory must be empty.")
	_check(world.world_changed == false, "Garden must begin unchanged.")
	_check(world.village_trust == 0, "Village trust must begin at 0.")

	world.player_position = Vector2(260, 150)
	world._interact()
	_check(world.stage == 1, "Mira must advance stage 0 -> 1.")

	world.player_position = Vector2(430, 120)
	world._interact()
	_check(world.stage == 2, "Sora must advance stage 1 -> 2.")

	for pos in [Vector2(170,410), Vector2(360,390), Vector2(560,410)]:
		world.player_position = pos
		world._interact()

	_check(world.inventory.size() == 3, "Three pickups must produce three collected parts.")

	world.player_position = Vector2(700, 160)
	world._interact()
	_check(world.stage == 2, "Lab must block progression with a missing part.")

	world.player_position = Vector2(710, 350)
	world._interact()
	_check(world.inventory.size() == 4, "Fourth pickup must complete required parts.")

	world.player_position = Vector2(700, 160)
	world._interact()
	_check(world.stage == 3, "Complete parts at lab must advance stage 2 -> 3.")

	world.player_position = Vector2(820, 285)
	world._interact()
	_check(world.stage == 4, "Pump installation must advance stage 3 -> 4.")
	_check(world.world_changed == true, "Pump installation must change world state.")
	_check(world.village_trust == 1, "Pump installation must increase village trust.")

	world.player_position = Vector2(510, 270)
	world._interact()
	_check(world.stage == 5, "Tower interaction must complete the vertical slice.")

	var saved_position: Vector2 = world.player_position
	world._save_game()
	world.stage = 0
	world.inventory = {}
	world.world_changed = false
	world.village_trust = 0
	world.player_position = Vector2.ZERO
	world._load_game()

	_check(world.stage == 5, "Load must restore quest stage.")
	_check(world.inventory.size() == 4, "Load must restore collected parts.")
	_check(world.world_changed == true, "Load must restore world-change state.")
	_check(world.village_trust == 1, "Load must restore village trust.")
	_check(world.player_position.is_equal_approx(saved_position), "Load must restore player position.")

	_finish()

func _finish() -> void:
	if failures.is_empty():
		print("VERTICAL_SLICE_SMOKE: PASS")
		quit(0)
		return
	for failure in failures:
		push_error("VERTICAL_SLICE_SMOKE: " + failure)
	print("VERTICAL_SLICE_SMOKE: FAIL (%d)" % failures.size())
	quit(1)
