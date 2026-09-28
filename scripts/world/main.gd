extends Node2D

const SPEED := 220.0
const INTERACT_DISTANCE := 64.0
const SAVE_PATH := "user://nick_luminous_valley_save.json"
const SAVE_VERSION := 2
const CONTENT_PATH := "res://data/vertical_slice.json"

const HUD_SCRIPT = preload("res://scripts/ui/hud.gd")
const WORLD_RENDERER_SCRIPT = preload("res://scripts/world/world_renderer.gd")
const SAVE_STORE = preload("res://scripts/systems/save_store.gd")

var player_position := Vector2(110, 270)
var facing := Vector2.DOWN
var stage := 0
var inventory := {}
var world_changed := false
var village_trust := 0
var message := "Find Mira in the workshop yard."
var elapsed := 0.0

var content: Dictionary = {}
var points: Array = []
var hud: CanvasLayer
var world_renderer: Node2D

func _ready() -> void:
	_load_content()
	world_renderer = WORLD_RENDERER_SCRIPT.new()
	add_child(world_renderer)
	hud = HUD_SCRIPT.new()
	add_child(hud)
	hud.build_ui()
	_refresh_presentation()

func _load_content() -> void:
	var raw := FileAccess.get_file_as_string(CONTENT_PATH)
	var parsed = JSON.parse_string(raw)
	if typeof(parsed) != TYPE_DICTIONARY:
		push_error("Unable to parse vertical slice content.")
		content = {"title":"Nick's First Spark","objectives":[],"points":[]}
		points = []
		return
	content = parsed
	points = []
	for source in content.get("points", []):
		var point: Dictionary = source.duplicate(true)
		var pos: Array = point.get("pos", [0, 0])
		point["pos"] = Vector2(float(pos[0]), float(pos[1]))
		points.append(point)

func _process(delta: float) -> void:
	elapsed += delta
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if Input.is_key_pressed(KEY_A): direction.x -= 1.0
	if Input.is_key_pressed(KEY_D): direction.x += 1.0
	if Input.is_key_pressed(KEY_W): direction.y -= 1.0
	if Input.is_key_pressed(KEY_S): direction.y += 1.0
	if direction.length() > 1.0:
		direction = direction.normalized()
	if direction.length() > 0.05:
		facing = direction.normalized()
	player_position += direction * SPEED * delta
	player_position.x = clamp(player_position.x, 24.0, 936.0)
	player_position.y = clamp(player_position.y, 96.0, 468.0)
	_refresh_presentation()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_ENTER or event.keycode == KEY_SPACE:
			_interact()
		elif event.keycode == KEY_F5:
			_save_game()
		elif event.keycode == KEY_F9:
			_load_game()

func _interact() -> void:
	var target := _nearest_point()
	if target.is_empty():
		message = "Nothing nearby responds."
	elif target.id == "mira" and stage == 0:
		stage = 1
		message = "Mira: The irrigation pump is dead. Sora has been tracking what the garden needs."
	elif target.id == "sora" and stage == 1:
		stage = 2
		message = "Sora: We can save the beds. Find wire, a solar cell, a pipe fitting, and resin."
	elif target.kind == "item" and stage >= 2 and not inventory.has(target.id):
		inventory[target.id] = true
		message = "Recovered %s (%d/4)." % [target.name, inventory.size()]
	elif target.id == "lab" and stage == 2:
		if _has_all_parts():
			stage = 3
			message = "The circuit stabilizes. The rebuilt solar-assisted pump is ready to install."
		else:
			message = "The bench is ready, but %d component(s) are still missing." % (4 - inventory.size())
	elif target.id == "pump" and stage == 3:
		stage = 4
		world_changed = true
		village_trust = 1
		message = "Water returns to the beds. The garden wakes up—and people notice."
	elif target.id == "tower" and stage == 4:
		stage = 5
		message = "A coded signal breaks through your grandfather's tower: three tones, then your name."
	else:
		message = "%s has nothing new for the current objective." % target.name
	_refresh_presentation()

func _nearest_point() -> Dictionary:
	var best: Dictionary = {}
	var best_distance := INTERACT_DISTANCE
	for point in points:
		if point.kind == "item" and inventory.has(point.id):
			continue
		var distance := player_position.distance_to(point.pos)
		if distance <= best_distance:
			best = point
			best_distance = distance
	return best

func _has_all_parts() -> bool:
	for id in ["wire", "solar", "pipe", "resin"]:
		if not inventory.has(id):
			return false
	return true

func _objective() -> String:
	var objectives: Array = content.get("objectives", [])
	if stage >= 0 and stage < objectives.size():
		return "Objective: %s" % objectives[stage]
	return "Objective: Continue exploring."

func _interaction_hint() -> String:
	var target := _nearest_point()
	if target.is_empty():
		return ""
	return "[Enter] %s" % target.get("hint", "Interact")

func _refresh_presentation() -> void:
	if hud != null:
		hud.refresh(
			str(content.get("title", "Nick's Luminous Valley")),
			_objective(),
			inventory.size(),
			village_trust,
			message,
			_interaction_hint()
		)
	if world_renderer != null:
		var nearest := _nearest_point()
		var nearest_id := "" if nearest.is_empty() else str(nearest.id)
		world_renderer.sync_state(
			points,
			inventory,
			stage,
			world_changed,
			player_position,
			facing,
			elapsed,
			nearest_id
		)

func _save_game() -> void:
	var payload := {
		"version": SAVE_VERSION,
		"stage": stage,
		"inventory": inventory,
		"world_changed": world_changed,
		"village_trust": village_trust,
		"player": [player_position.x, player_position.y]
	}
	if SAVE_STORE.write_payload(SAVE_PATH, payload):
		message = "Progress saved."
	else:
		message = "Save failed."
	_refresh_presentation()

func _load_game() -> void:
	var result: Dictionary = SAVE_STORE.read_payload(SAVE_PATH)
	if not result.get("ok", false):
		var error := str(result.get("error", ""))
		message = "No save exists yet." if error == "missing" else "Save file could not be read."
		_refresh_presentation()
		return

	var payload: Dictionary = result.get("payload", {})
	var version := int(payload.get("version", 1))
	if version > SAVE_VERSION:
		message = "This save was created by a newer game version."
		_refresh_presentation()
		return

	stage = clampi(int(payload.get("stage", 0)), 0, 5)
	inventory = payload.get("inventory", {})
	world_changed = bool(payload.get("world_changed", false))
	village_trust = int(payload.get("village_trust", 1 if world_changed else 0))
	var saved_pos = payload.get("player", [110, 270])
	if saved_pos is Array and saved_pos.size() >= 2:
		player_position = Vector2(float(saved_pos[0]), float(saved_pos[1]))
	message = "Progress loaded."
	_refresh_presentation()
