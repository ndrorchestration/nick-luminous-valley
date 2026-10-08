extends SceneTree

const OUTPUT_DIR := "res://visual-evidence"

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(OUTPUT_DIR))

	var packed := load("res://scenes/world/main.tscn") as PackedScene
	if packed == null:
		push_error("VISUAL_EVIDENCE: main scene failed to load")
		quit(1)
		return

	var world = packed.instantiate()
	root.add_child(world)
	await process_frame
	await process_frame

	await _capture("01_opening")

	# Capture actual in-world cardinal sprite presentation for review, without
	# advancing the quest or changing movement/input behavior.
	for pose in [
		{"facing": Vector2.UP, "name": "05_nick_facing_up"},
		{"facing": Vector2.LEFT, "name": "06_nick_facing_left"},
		{"facing": Vector2.RIGHT, "name": "07_nick_facing_right"}
	]:
		world.facing = pose.facing
		world._refresh_presentation()
		await _capture(pose.name)
	world.facing = Vector2.DOWN
	world._refresh_presentation()

	world.player_position = Vector2(260, 150)
	world._interact()
	world.player_position = Vector2(430, 120)
	world._interact()
	for pos in [Vector2(170,410), Vector2(360,390), Vector2(560,410), Vector2(710,350)]:
		world.player_position = pos
		world._interact()
	world.player_position = Vector2(700, 160)
	world._refresh_presentation()
	await _capture("02_components_and_lab")

	world._interact()
	world.player_position = Vector2(820, 285)
	world._interact()
	world._refresh_presentation()
	await _capture("03_restored_garden")

	world.player_position = Vector2(510, 270)
	world._interact()
	world._refresh_presentation()
	await _capture("04_tower_signal")

	print("VISUAL_EVIDENCE: PASS")
	quit(0)

func _capture(file_stem: String) -> void:
	await process_frame
	await RenderingServer.frame_post_draw
	var image := root.get_texture().get_image()
	if image == null or image.is_empty():
		push_error("VISUAL_EVIDENCE: viewport image unavailable for " + file_stem)
		quit(1)
		return
	var path := "%s/%s.png" % [OUTPUT_DIR, file_stem]
	var error := image.save_png(path)
	if error != OK:
		push_error("VISUAL_EVIDENCE: failed to save " + path)
		quit(1)
		return
	print("VISUAL_EVIDENCE: wrote " + path)
