extends Node2D

const ASSET_MANIFEST_PATH := "res://data/visual_assets.json"
const ASSET_CATALOG = preload("res://scripts/world/asset_catalog.gd")

var points: Array = []
var inventory: Dictionary = {}
var stage := 0
var world_changed := false
var player_position := Vector2.ZERO
var facing := Vector2.DOWN
var elapsed := 0.0
var nearest_id := ""

var asset_manifest: Dictionary = {}
var asset_textures: Dictionary = {}

func _ready() -> void:
	asset_manifest = ASSET_CATALOG.load_manifest(ASSET_MANIFEST_PATH)
	_cache_manifest_textures()

func _cache_manifest_textures() -> void:
	asset_textures = {}
	var slots: Dictionary = asset_manifest.get("slots", {})
	for slot_id in slots.keys():
		var entry: Dictionary = slots.get(slot_id, {})
		var texture := ASSET_CATALOG.texture_from_entry(entry)
		if texture != null:
			asset_textures[str(slot_id)] = texture

func sync_state(
	source_points: Array,
	source_inventory: Dictionary,
	source_stage: int,
	source_world_changed: bool,
	source_player_position: Vector2,
	source_facing: Vector2,
	source_elapsed: float,
	source_nearest_id: String
) -> void:
	points = source_points
	inventory = source_inventory
	stage = source_stage
	world_changed = source_world_changed
	player_position = source_player_position
	facing = source_facing
	elapsed = source_elapsed
	nearest_id = source_nearest_id
	queue_redraw()

func _slot_entry(slot_id: String) -> Dictionary:
	var slots: Dictionary = asset_manifest.get("slots", {})
	return slots.get(slot_id, {})

func _slot_texture(slot_id: String) -> Texture2D:
	return asset_textures.get(slot_id, null)

func _draw_slot(slot_id: String, center: Vector2, fallback_size: Vector2) -> bool:
	var texture := _slot_texture(slot_id)
	if texture == null:
		return false
	var size := ASSET_CATALOG.size_from_entry(_slot_entry(slot_id), fallback_size)
	var rect := Rect2(center - size * 0.5, size)
	draw_texture_rect(texture, rect, false)
	return true

func _draw_zone_asset(slot_id: String, fallback_rect: Rect2) -> bool:
	var texture := _slot_texture(slot_id)
	if texture == null:
		return false
	var rect := ASSET_CATALOG.rect_from_entry(_slot_entry(slot_id), fallback_rect)
	draw_texture_rect(texture, rect, false)
	return true

func _draw_shadowed_zone(slot_id: String, rect: Rect2) -> bool:
	if _slot_texture(slot_id) == null:
		return false
	draw_rect(rect.grow(5.0) + Vector2(0, 4), Color(0, 0, 0, 0.20), true)
	return _draw_zone_asset(slot_id, rect)

func _draw_zone(rect: Rect2, fill: Color, edge: Color, label: String, label_pos: Vector2) -> void:
	draw_rect(rect, fill, true)
	draw_rect(rect, edge, false, 2.0)
	draw_string(ThemeDB.fallback_font, label_pos, label, HORIZONTAL_ALIGNMENT_LEFT, -1, 15, edge)

func _draw_entity_shadow(pos: Vector2, radius: float) -> void:
	draw_circle(pos + Vector2(0, 11), radius, Color(0, 0, 0, 0.24))

func _draw() -> void:
	draw_rect(Rect2(0, 0, 960, 540), Color("0e2119"))
	if not _draw_zone_asset("world_base", Rect2(0, 82, 960, 388)):
		draw_rect(Rect2(0, 82, 960, 388), Color("1b3124"))

	if not _draw_shadowed_zone("zone_workshop", Rect2(38, 108, 250, 142)):
		_draw_zone(Rect2(38, 108, 250, 142), Color("294936"), Color("7fb77e"), "WORKSHOP YARD", Vector2(52, 132))
	if not _draw_shadowed_zone("zone_lab", Rect2(640, 104, 270, 130)):
		_draw_zone(Rect2(640, 104, 270, 130), Color("303941"), Color("9ab7c9"), "GRANDFATHER'S LAB", Vector2(654, 128))
	if not _draw_shadowed_zone("zone_green", Rect2(320, 92, 255, 116)):
		_draw_zone(Rect2(320, 92, 255, 116), Color("253d35"), Color("78a795"), "VILLAGE GREEN", Vector2(334, 116))

	var garden_slot := "garden_after" if world_changed else "garden_before"
	if not _draw_shadowed_zone(garden_slot, Rect2(698, 250, 222, 192)):
		_draw_zone(
			Rect2(698, 250, 222, 192),
			Color("355a3c") if world_changed else Color("4b4531"),
			Color("a6c36f"),
			"VILLAGE GARDEN",
			Vector2(712, 274)
		)

	if not _draw_shadowed_zone("zone_creek", Rect2(70, 360, 590, 64)):
		draw_rect(Rect2(70, 360, 590, 64), Color("203f46"), true)
		draw_string(ThemeDB.fallback_font, Vector2(84, 386), "CREEK & SALVAGE PATH", HORIZONTAL_ALIGNMENT_LEFT, -1, 14, Color("83c9d8"))

	if not _draw_zone_asset(garden_slot, Rect2(698, 250, 222, 192)):
		for x in range(720, 900, 42):
			for y in range(300, 420, 36):
				draw_rect(Rect2(x, y, 28, 22), Color("51713f") if world_changed else Color("554b32"), true)
				if world_changed:
					draw_circle(Vector2(x + 14, y + 11), 4.0, Color("8ecb74"))

		var water_color := Color("6fc7dd") if world_changed else Color("315c68")
		draw_line(Vector2(720, 286), Vector2(900, 286), water_color, 5.0 if world_changed else 2.0)

	if world_changed:
		var shimmer := 3.0 + sin(elapsed * 5.0) * 1.5
		draw_circle(Vector2(820, 285), 21.0 + shimmer, Color(0.3, 0.75, 0.85, 0.10))

	if stage >= 5:
		var beam_alpha := 0.48 + sin(elapsed * 4.0) * 0.18
		draw_line(Vector2(510, 228), Vector2(510, 92), Color(0.65, 0.96, 1.0, beam_alpha), 4.0)
		draw_circle(Vector2(510, 105), 8.0 + sin(elapsed * 5.0) * 2.0, Color(0.72, 1.0, 0.95, 0.20))

	for point in points:
		if point.kind == "item" and inventory.has(point.id):
			continue

		var point_id := str(point.id)
		var shadow_radius := 7.0
		if point.kind == "npc":
			shadow_radius = 10.0
		elif point.kind == "station":
			shadow_radius = 12.0
		_draw_entity_shadow(point.pos, shadow_radius)

		if nearest_id == point_id:
			draw_circle(point.pos, 24.0 + sin(elapsed * 6.0), Color(0.78, 1.0, 0.9, 0.10))

		var used_asset := _draw_slot(point_id, point.pos, Vector2(32, 32))
		if used_asset:
			continue

		var color := Color("91c8ba")
		if point.kind == "npc":
			color = Color("e7a5ba")
		elif point.kind == "item":
			color = Color("e7cb70")
		elif point.kind == "station":
			color = Color("88b6e6")
		draw_circle(point.pos, 10.0, color)

	_draw_entity_shadow(player_position, 11.0)
	if not _draw_slot("player", player_position, Vector2(42, 42)):
		draw_circle(player_position, 12.0, Color("f4d66e"))
	draw_line(player_position + Vector2(0, 1), player_position + facing * 18.0, Color(1.0, 0.96, 0.70, 0.72), 2.0)
