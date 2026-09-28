extends Node2D

const SPEED := 220.0
const INTERACT_DISTANCE := 62.0
const SAVE_PATH := "user://nick_luminous_valley_save.json"

var player_position := Vector2(110, 270)
var stage := 0
var inventory := {}
var world_changed := false
var message := "Find Mira in the workshop yard."

var points := [
	{"id":"mira","name":"Mira","pos":Vector2(260,150),"kind":"npc"},
	{"id":"sora","name":"Sora","pos":Vector2(430,120),"kind":"npc"},
	{"id":"wire","name":"Copper Wire","pos":Vector2(170,410),"kind":"item"},
	{"id":"solar","name":"Cracked Solar Cell","pos":Vector2(360,390),"kind":"item"},
	{"id":"pipe","name":"Pipe Fitting","pos":Vector2(560,410),"kind":"item"},
	{"id":"resin","name":"Resin","pos":Vector2(710,350),"kind":"item"},
	{"id":"lab","name":"Lab Bench","pos":Vector2(700,160),"kind":"station"},
	{"id":"pump","name":"Garden Pump","pos":Vector2(820,285),"kind":"station"},
	{"id":"tower","name":"Transmission Tower","pos":Vector2(510,270),"kind":"station"}
]

var objective_label: Label
var inventory_label: Label
var message_label: Label

func _ready() -> void:
	objective_label = _make_label(Vector2(18, 14), 20)
	inventory_label = _make_label(Vector2(18, 44), 16)
	message_label = _make_label(Vector2(18, 492), 16)
	var help := _make_label(Vector2(640, 14), 14)
	help.text = "Move: arrows/WASD  Interact: Enter/Space\nSave: F5  Load: F9"
	_refresh_ui()
	queue_redraw()

func _process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if Input.is_key_pressed(KEY_A): direction.x -= 1.0
	if Input.is_key_pressed(KEY_D): direction.x += 1.0
	if Input.is_key_pressed(KEY_W): direction.y -= 1.0
	if Input.is_key_pressed(KEY_S): direction.y += 1.0
	if direction.length() > 1.0: direction = direction.normalized()
	player_position += direction * SPEED * delta
	player_position.x = clamp(player_position.x, 24.0, 936.0)
	player_position.y = clamp(player_position.y, 80.0, 470.0)
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
		message = "Nothing nearby to interact with."
	elif target.id == "mira" and stage == 0:
		stage = 1
		message = "Mira: The irrigation pump is dead. Sora knows what the garden needs."
	elif target.id == "sora" and stage == 1:
		stage = 2
		message = "Sora: Recover wire, a solar cell, a pipe fitting, and resin."
	elif target.kind == "item" and stage >= 2 and not inventory.has(target.id):
		inventory[target.id] = true
		message = "Collected %s." % target.name
	elif target.id == "lab" and stage == 2:
		if _has_all_parts():
			stage = 3
			message = "The lab test stabilizes the circuit. The solar-assisted pump is ready."
		else:
			message = "The bench needs all four recovered components."
	elif target.id == "pump" and stage == 3:
		stage = 4
		world_changed = true
		message = "Pump installed. Water returns to the garden and village trust rises."
	elif target.id == "tower" and stage == 4:
		stage = 5
		message = "A strange signal breaks through your grandfather's transmission tower. Vertical slice complete."
	else:
		message = "%s has nothing new for the current objective." % target.name
	_refresh_ui()
	queue_redraw()

func _nearest_point() -> Dictionary:
	var best := {}
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
	for id in ["wire","solar","pipe","resin"]:
		if not inventory.has(id):
			return false
	return true

func _objective() -> String:
	match stage:
		0: return "Objective: Talk to Mira."
		1: return "Objective: Talk to Sora."
		2: return "Objective: Collect four repair components, then use the Lab Bench."
		3: return "Objective: Install the repaired pump in the garden."
		4: return "Objective: Investigate the Transmission Tower."
		_: return "Objective: Vertical slice complete."

func _refresh_ui() -> void:
	objective_label.text = _objective()
	inventory_label.text = "Parts: %d/4" % inventory.size()
	message_label.text = message

func _make_label(pos: Vector2, font_size: int) -> Label:
	var label := Label.new()
	label.position = pos
	label.add_theme_font_size_override("font_size", font_size)
	add_child(label)
	return label

func _save_game() -> void:
	var payload := {"stage":stage,"inventory":inventory,"world_changed":world_changed,"player":[player_position.x, player_position.y]}
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(payload))
		message = "Game saved."
		_refresh_ui()

func _load_game() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		message = "No save exists yet."
		_refresh_ui()
		return
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	var payload = JSON.parse_string(file.get_as_text())
	if typeof(payload) != TYPE_DICTIONARY:
		message = "Save file could not be read."
		_refresh_ui()
		return
	stage = int(payload.get("stage", 0))
	inventory = payload.get("inventory", {})
	world_changed = bool(payload.get("world_changed", false))
	var saved_pos = payload.get("player", [110,270])
	player_position = Vector2(float(saved_pos[0]), float(saved_pos[1]))
	message = "Game loaded."
	_refresh_ui()
	queue_redraw()

func _draw() -> void:
	draw_rect(Rect2(0, 0, 960, 540), Color("17251d"))
	draw_rect(Rect2(35, 90, 270, 180), Color("314634"))
	draw_rect(Rect2(650, 90, 255, 145), Color("3a3f46"))
	draw_rect(Rect2(720, 250, 190, 190), Color("35563c") if world_changed else Color("4a4030"))
	draw_circle(player_position, 12.0, Color("f5d76e"))
	for point in points:
		if point.kind == "item" and inventory.has(point.id):
			continue
		var color := Color("8ad1c2")
		if point.kind == "npc": color = Color("e6a4b4")
		elif point.kind == "item": color = Color("e7c46a")
		elif point.kind == "station": color = Color("87aee6")
		draw_circle(point.pos, 10.0, color)
		draw_string(ThemeDB.fallback_font, point.pos + Vector2(-34, -16), point.name, HORIZONTAL_ALIGNMENT_LEFT, -1, 13, Color.WHITE)
