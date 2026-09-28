extends Node2D

const SPEED := 220.0
const INTERACT_DISTANCE := 64.0
const SAVE_PATH := "user://nick_luminous_valley_save.json"
const SAVE_VERSION := 2
const CONTENT_PATH := "res://data/vertical_slice.json"

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

var title_label: Label
var objective_label: Label
var inventory_label: Label
var trust_label: Label
var message_label: Label
var hint_label: Label

func _ready() -> void:
	_load_content()
	_build_ui()
	_refresh_ui()
	queue_redraw()

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

func _build_ui() -> void:
	title_label = _make_label(Vector2(18, 12), Vector2(520, 28), 20)
	objective_label = _make_label(Vector2(18, 41), Vector2(620, 25), 16)
	inventory_label = _make_label(Vector2(18, 68), Vector2(210, 22), 14)
	trust_label = _make_label(Vector2(230, 68), Vector2(210, 22), 14)
	hint_label = _make_label(Vector2(620, 450), Vector2(320, 24), 15)
	message_label = _make_label(Vector2(24, 484), Vector2(912, 44), 15)
	var help := _make_label(Vector2(650, 14), Vector2(290, 52), 13)
	help.text = "Move: arrows / WASD\nInteract: Enter / Space   Save: F5   Load: F9"

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
	_refresh_hint()
	queue_redraw()

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
	_refresh_ui()
	queue_redraw()

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

func _refresh_ui() -> void:
	title_label.text = str(content.get("title", "Nick's Luminous Valley"))
	objective_label.text = _objective()
	inventory_label.text = "Repair parts: %d / 4" % inventory.size()
	trust_label.text = "Village trust: %d" % village_trust
	message_label.text = message
	_refresh_hint()

func _refresh_hint() -> void:
	if hint_label == null:
		return
	var target := _nearest_point()
	if target.is_empty():
		hint_label.text = ""
	else:
		hint_label.text = "[Enter] %s" % target.get("hint", "Interact")

func _make_label(pos: Vector2, dimensions: Vector2, font_size: int) -> Label:
	var label := Label.new()
	label.position = pos
	label.size = dimensions
	label.add_theme_font_size_override("font_size", font_size)
	label.add_theme_color_override("font_color", Color("eef7e8"))
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(label)
	return label

func _save_game() -> void:
	var payload := {
		"version": SAVE_VERSION,
		"stage": stage,
		"inventory": inventory,
		"world_changed": world_changed,
		"village_trust": village_trust,
		"player": [player_position.x, player_position.y]
	}
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(payload))
		message = "Progress saved."
	else:
		message = "Save failed."
	_refresh_ui()

func _load_game() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		message = "No save exists yet."
		_refresh_ui()
		return
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		message = "Save file could not be opened."
		_refresh_ui()
		return
	var payload = JSON.parse_string(file.get_as_text())
	if typeof(payload) != TYPE_DICTIONARY:
		message = "Save file could not be read."
		_refresh_ui()
		return
	var version := int(payload.get("version", 1))
	if version > SAVE_VERSION:
		message = "This save was created by a newer game version."
		_refresh_ui()
		return
	stage = clampi(int(payload.get("stage", 0)), 0, 5)
	inventory = payload.get("inventory", {})
	world_changed = bool(payload.get("world_changed", false))
	village_trust = int(payload.get("village_trust", 1 if world_changed else 0))
	var saved_pos = payload.get("player", [110, 270])
	if saved_pos is Array and saved_pos.size() >= 2:
		player_position = Vector2(float(saved_pos[0]), float(saved_pos[1]))
	message = "Progress loaded."
	_refresh_ui()
	queue_redraw()

func _draw_zone(rect: Rect2, fill: Color, edge: Color, label: String, label_pos: Vector2) -> void:
	draw_rect(rect, fill, true)
	draw_rect(rect, edge, false, 2.0)
	draw_string(ThemeDB.fallback_font, label_pos, label, HORIZONTAL_ALIGNMENT_LEFT, -1, 15, edge)

func _draw() -> void:
	draw_rect(Rect2(0, 0, 960, 540), Color("102019"))
	draw_rect(Rect2(0, 82, 960, 388), Color("1b3124"))

	_draw_zone(Rect2(38, 108, 250, 142), Color("294936"), Color("7fb77e"), "WORKSHOP YARD", Vector2(52, 132))
	_draw_zone(Rect2(640, 104, 270, 130), Color("303941"), Color("9ab7c9"), "GRANDFATHER'S LAB", Vector2(654, 128))
	_draw_zone(Rect2(698, 250, 222, 192), Color("355a3c") if world_changed else Color("4b4531"), Color("a6c36f"), "VILLAGE GARDEN", Vector2(712, 274))
	_draw_zone(Rect2(320, 92, 255, 116), Color("253d35"), Color("78a795"), "VILLAGE GREEN", Vector2(334, 116))

	draw_rect(Rect2(70, 360, 590, 64), Color("203f46"), true)
	draw_string(ThemeDB.fallback_font, Vector2(84, 386), "CREEK & SALVAGE PATH", HORIZONTAL_ALIGNMENT_LEFT, -1, 14, Color("83c9d8"))

	for x in range(720, 900, 42):
		for y in range(300, 420, 36):
			draw_rect(Rect2(x, y, 28, 22), Color("51713f") if world_changed else Color("554b32"), true)
			if world_changed:
				draw_circle(Vector2(x + 14, y + 11), 4.0, Color("8ecb74"))

	var water_color := Color("6fc7dd") if world_changed else Color("315c68")
	draw_line(Vector2(720, 286), Vector2(900, 286), water_color, 5.0 if world_changed else 2.0)
	if world_changed:
		var shimmer := 3.0 + sin(elapsed * 5.0) * 1.5
		draw_circle(Vector2(820, 285), 18.0 + shimmer, Color(0.3, 0.75, 0.85, 0.12))

	draw_line(Vector2(510, 224), Vector2(510, 300), Color("8aa7a1"), 4.0)
	draw_line(Vector2(490, 248), Vector2(530, 248), Color("8aa7a1"), 3.0)
	if stage >= 5:
		var beam_alpha := 0.45 + sin(elapsed * 4.0) * 0.2
		draw_line(Vector2(510, 224), Vector2(510, 110), Color(0.6, 0.95, 1.0, beam_alpha), 3.0)

	var nearest := _nearest_point()
	for point in points:
		if point.kind == "item" and inventory.has(point.id):
			continue
		var color := Color("91c8ba")
		if point.kind == "npc":
			color = Color("e7a5ba")
		elif point.kind == "item":
			color = Color("e7cb70")
		elif point.kind == "station":
			color = Color("88b6e6")
		var radius := 10.0
		if not nearest.is_empty() and nearest.id == point.id:
			radius += 2.0 + sin(elapsed * 6.0)
			draw_circle(point.pos, radius + 7.0, Color(1, 1, 1, 0.10))
		draw_circle(point.pos, radius, color)
		draw_string(ThemeDB.fallback_font, point.pos + Vector2(-40, -17), point.name, HORIZONTAL_ALIGNMENT_LEFT, -1, 13, Color("f6f3dd"))

	draw_circle(player_position + Vector2(0, 7), 11.0, Color(0, 0, 0, 0.22))
	draw_circle(player_position, 12.0, Color("f4d66e"))
	draw_line(player_position, player_position + facing * 14.0, Color("fff4b3"), 3.0)

	draw_rect(Rect2(12, 6, 620, 88), Color(0.03, 0.08, 0.06, 0.78), true)
	draw_rect(Rect2(638, 6, 310, 66), Color(0.03, 0.08, 0.06, 0.72), true)
	draw_rect(Rect2(12, 476, 936, 56), Color(0.03, 0.08, 0.06, 0.88), true)
