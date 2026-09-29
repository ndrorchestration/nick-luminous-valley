extends Node2D

const ASSET_MANIFEST_PATH := "res://data/visual_assets.json"
const ASSET_CATALOG = preload("res://scripts/world/asset_catalog.gd")
const MOTION_PROFILE_VERSION := 1
const PRESENTATION_PROFILE_VERSION := 2

var points: Array = []
var inventory: Dictionary = {}
var stage := 0
var world_changed := false
var player_position := Vector2.ZERO
var facing := Vector2.DOWN
var elapsed := 0.0
var nearest_id := ""

var motion_enabled := true
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

func _motion_phase(slot_id: String) -> float:
	return deg_to_rad(float(abs(slot_id.hash()) % 360))

func _motion_offset(slot_id: String, source_facing: Vector2, time_value: float) -> Vector2:
	if not motion_enabled:
		return Vector2.ZERO

	var phase := _motion_phase(slot_id)
	if slot_id == "player":
		var direction := source_facing.normalized() if source_facing.length() > 0.001 else Vector2.DOWN
		return direction * 1.5 + Vector2(0, sin(time_value * 8.0) * 1.4)
	if slot_id in ["mira", "sora"]:
		return Vector2(0, sin(time_value * 2.4 + phase) * 0.8)
	if slot_id in ["wire", "solar", "pipe", "resin"]:
		return Vector2(0, sin(time_value * 3.3 + phase) * 2.2)
	if slot_id == "tower" and stage >= 5:
		return Vector2(0, sin(time_value * 4.0) * 0.7)
	return Vector2.ZERO

func _draw_slot(slot_id: String, center: Vector2, fallback_size: Vector2, offset := Vector2.ZERO) -> bool:
	var texture := _slot_texture(slot_id)
	if texture == null:
		return false
	var size := ASSET_CATALOG.size_from_entry(_slot_entry(slot_id), fallback_size)
	var rect := Rect2(center + offset - size * 0.5, size)
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
	var shadow_rect := rect.grow(5.0)
	shadow_rect.position += Vector2(0, 4)
	draw_rect(shadow_rect, Color(0, 0, 0, 0.20), true)
	return _draw_zone_asset(slot_id, rect)

func _draw_zone(rect: Rect2, fill: Color, edge: Color, label: String, label_pos: Vector2) -> void:
	draw_rect(rect, fill, true)
	draw_rect(rect, edge, false, 2.0)
	draw_string(ThemeDB.fallback_font, label_pos, label, HORIZONTAL_ALIGNMENT_LEFT, -1, 15, edge)

func _draw_entity_shadow(pos: Vector2, radius: float) -> void:
	draw_circle(pos + Vector2(0, 11), radius, Color(0, 0, 0, 0.24))

func _draw_environment_depth() -> void:
	# A deliberately shallow 2D lighting/dressing layer: enough to break up flat fields
	# without changing collision, quest state, authored asset slots, or interaction geometry.
	draw_rect(Rect2(0, 82, 960, 388), Color(0.96, 0.84, 0.56, 0.018), true)
	draw_rect(Rect2(0, 82, 960, 18), Color(0.72, 0.92, 0.74, 0.035), true)
	draw_rect(Rect2(0, 446, 960, 24), Color(0.0, 0.0, 0.0, 0.10), true)

	# Localized dapple patches give each authored space a material identity without
	# reading as a single geometric light disk in the fixed 960x540 composition.
	for light_pos in [Vector2(146, 148), Vector2(180, 170), Vector2(205, 154)]:
		draw_circle(light_pos, 30.0, Color(1.0, 0.72, 0.38, 0.012))
	for light_pos in [Vector2(416, 128), Vector2(454, 154), Vector2(492, 130)]:
		draw_circle(light_pos, 34.0, Color(0.84, 0.94, 0.58, 0.014))
	for light_pos in [Vector2(754, 146), Vector2(787, 170), Vector2(817, 150)]:
		draw_circle(light_pos, 28.0, Color(0.50, 0.90, 0.92, 0.013))
	if world_changed:
		for light_pos in [Vector2(786, 322), Vector2(824, 354), Vector2(862, 330)]:
			draw_circle(light_pos, 38.0, Color(0.68, 1.0, 0.58, 0.018))
	else:
		for light_pos in [Vector2(792, 326), Vector2(842, 350)]:
			draw_circle(light_pos, 34.0, Color(0.55, 0.45, 0.28, 0.010))

	# Creek banks and small reeds create depth cues without adding collision.
	draw_line(Vector2(70, 357), Vector2(660, 357), Color(0.58, 0.78, 0.60, 0.16), 2.0)
	draw_line(Vector2(70, 426), Vector2(660, 426), Color(0.02, 0.08, 0.06, 0.36), 2.0)
	var reed_xs: Array[float] = [86.0, 118.0, 642.0]
	for reed_x in reed_xs:
		draw_line(Vector2(reed_x, 371), Vector2(reed_x - 2.0, 359), Color(0.48, 0.68, 0.42, 0.42), 2.0)
		draw_line(Vector2(reed_x + 4.0, 372), Vector2(reed_x + 7.0, 361), Color(0.56, 0.74, 0.46, 0.34), 1.0)

	# Boundary foliage softens the rectangular authored zones and helps the field read as one place.
	var shrubs: Array[Vector2] = [
		Vector2(18, 122), Vector2(306, 111), Vector2(607, 119), Vector2(938, 139),
		Vector2(30, 316), Vector2(675, 318), Vector2(675, 432), Vector2(941, 421),
		Vector2(302, 449)
	]
	for shrub_pos in shrubs:
		draw_circle(shrub_pos + Vector2(1.5, 3.0), 6.5, Color(0.0, 0.0, 0.0, 0.16))
		draw_circle(shrub_pos, 5.6, Color(0.17, 0.32, 0.20, 0.92))
		draw_circle(shrub_pos + Vector2(-2.0, -2.0), 2.2, Color(0.38, 0.55, 0.30, 0.65))

func _draw_atmosphere() -> void:
	if not motion_enabled:
		return

	for i in range(9):
		var mote_x := 34.0 + fposmod(float(i * 113) + elapsed * 7.0, 892.0)
		var mote_y := 116.0 + fposmod(float(i * 67) + sin(elapsed * 0.8 + float(i)) * 18.0, 320.0)
		var mote_alpha := 0.025 + 0.025 * (0.5 + 0.5 * sin(elapsed * 1.7 + float(i)))
		draw_circle(Vector2(mote_x, mote_y), 1.2, Color(0.82, 0.96, 0.84, mote_alpha))

	for i in range(6):
		var glint_x := 92.0 + fposmod(float(i * 97) + elapsed * 28.0, 540.0)
		var glint_y := 382.0 + sin(elapsed * 2.0 + float(i)) * 6.0
		draw_line(Vector2(glint_x, glint_y), Vector2(glint_x + 11.0, glint_y), Color(0.55, 0.90, 0.96, 0.16), 1.0)

	if world_changed:
		for i in range(8):
			var garden_x := 716.0 + fposmod(float(i * 31) + elapsed * 10.0, 184.0)
			var garden_y := 300.0 + fposmod(float(i * 47) - elapsed * 8.0, 116.0)
			var pulse := 0.08 + 0.07 * (0.5 + 0.5 * sin(elapsed * 2.3 + float(i)))
			draw_circle(Vector2(garden_x, garden_y), 1.6, Color(0.72, 1.0, 0.66, pulse))

	if stage >= 5:
		var sweep := 455.0 + fposmod(elapsed * 46.0, 110.0)
		draw_line(Vector2(sweep, 112), Vector2(sweep + 18.0, 112), Color(0.68, 0.98, 1.0, 0.12), 1.0)

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

	_draw_environment_depth()

	_draw_atmosphere()

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

		var point_offset := _motion_offset(point_id, Vector2.ZERO, elapsed)
		var used_asset := _draw_slot(point_id, point.pos, Vector2(32, 32), point_offset)
		if used_asset:
			continue

		var color := Color("91c8ba")
		if point.kind == "npc":
			color = Color("e7a5ba")
		elif point.kind == "item":
			color = Color("e7cb70")
		elif point.kind == "station":
			color = Color("88b6e6")
		draw_circle(point.pos + point_offset, 10.0, color)

	_draw_entity_shadow(player_position, 11.0)
	var player_offset := _motion_offset("player", facing, elapsed)
	if not _draw_slot("player", player_position, Vector2(42, 42), player_offset):
		draw_circle(player_position + player_offset, 12.0, Color("f4d66e"))
	draw_line(player_position + Vector2(0, 1), player_position + facing * 18.0, Color(1.0, 0.96, 0.70, 0.72), 2.0)
