extends Node2D

var points: Array = []
var inventory: Dictionary = {}
var stage := 0
var world_changed := false
var player_position := Vector2.ZERO
var facing := Vector2.DOWN
var elapsed := 0.0
var nearest_id := ""

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
		if nearest_id == str(point.id):
			radius += 2.0 + sin(elapsed * 6.0)
			draw_circle(point.pos, radius + 7.0, Color(1, 1, 1, 0.10))
		draw_circle(point.pos, radius, color)
		draw_string(ThemeDB.fallback_font, point.pos + Vector2(-40, -17), point.name, HORIZONTAL_ALIGNMENT_LEFT, -1, 13, Color("f6f3dd"))

	draw_circle(player_position + Vector2(0, 7), 11.0, Color(0, 0, 0, 0.22))
	draw_circle(player_position, 12.0, Color("f4d66e"))
	draw_line(player_position, player_position + facing * 14.0, Color("fff4b3"), 3.0)
