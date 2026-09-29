extends CanvasLayer

const HUD_PROFILE_VERSION := 2

var title_label: Label
var objective_label: Label
var inventory_label: Label
var trust_label: Label
var message_label: Label
var hint_label: Label
var hint_panel: Panel
var hint_accent: ColorRect
var objective_tag_label: Label
var controls_title_label: Label
var message_tag_label: Label

func build_ui() -> void:
	_add_panel(Vector2(12, 6), Vector2(574, 76), Color(0.018, 0.052, 0.043, 0.95), Color("d7bd68"), Color(0.0, 0.0, 0.0, 0.42))
	_add_panel(Vector2(598, 6), Vector2(350, 58), Color(0.018, 0.048, 0.045, 0.91), Color("6ebdb1"), Color(0.0, 0.0, 0.0, 0.38))
	_add_panel(Vector2(12, 484), Vector2(936, 48), Color(0.016, 0.043, 0.038, 0.96), Color("d7bd68"), Color(0.0, 0.0, 0.0, 0.46))
	hint_panel = _add_panel(Vector2(648, 448), Vector2(300, 30), Color(0.025, 0.085, 0.070, 0.96), Color("82d9c1"), Color(0.0, 0.0, 0.0, 0.40))

	_add_accent(Vector2(18, 12), Vector2(3, 60), Color("d7bd68"))
	_add_accent(Vector2(25, 12), Vector2(34, 2), Color("78d5c0"))
	_add_accent(Vector2(603, 11), Vector2(3, 46), Color("78d5c0"))
	_add_accent(Vector2(18, 490), Vector2(3, 35), Color("d7bd68"))
	hint_accent = _add_accent(Vector2(653, 454), Vector2(3, 18), Color("82d9c1"))

	title_label = _make_label(Vector2(28, 10), Vector2(540, 21), 17, Color("fff0b7"))
	title_label.add_theme_color_override("font_shadow_color", Color(0.0, 0.0, 0.0, 0.72))
	title_label.add_theme_constant_override("shadow_offset_x", 1)
	title_label.add_theme_constant_override("shadow_offset_y", 1)

	objective_tag_label = _make_label(Vector2(29, 33), Vector2(68, 17), 10, Color("d7bd68"))
	objective_tag_label.text = "OBJECTIVE"
	objective_label = _make_label(Vector2(96, 31), Vector2(466, 20), 13, Color("e0f4eb"))

	inventory_label = _make_stat_chip(Vector2(29, 56), Vector2(176, 19), Color("f0d477"))
	trust_label = _make_stat_chip(Vector2(211, 56), Vector2(168, 19), Color("9ee2b8"))

	controls_title_label = _make_label(Vector2(613, 11), Vector2(320, 16), 10, Color("d7bd68"))
	controls_title_label.text = "FIELD CONTROLS"
	var help := _make_label(Vector2(613, 27), Vector2(320, 28), 12, Color("c9ddd7"))
	help.text = "Move  WASD / arrows     Enter  interact\nF5  save                     F9  load"

	message_tag_label = _make_label(Vector2(29, 488), Vector2(82, 16), 10, Color("d7bd68"))
	message_tag_label.text = "FIELD LOG"
	message_label = _make_label(Vector2(108, 489), Vector2(824, 33), 14, Color("f6f1d9"))

	hint_label = _make_label(Vector2(662, 454), Vector2(274, 18), 14, Color("edfff7"))
	hint_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

func refresh(title: String, objective: String, part_count: int, trust: int, message: String, hint: String) -> void:
	title_label.text = title
	objective_label.text = objective.trim_prefix("Objective:").strip_edges()
	inventory_label.text = "PARTS  %d / 4" % part_count
	trust_label.text = "TRUST  %d" % trust
	message_label.text = message
	hint_label.text = hint
	hint_panel.visible = not hint.is_empty()
	hint_accent.visible = hint_panel.visible

func _add_panel(pos: Vector2, dimensions: Vector2, color: Color, border_color: Color, shadow_color: Color) -> Panel:
	var panel := Panel.new()
	panel.position = pos
	panel.size = dimensions
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.border_color = border_color
	style.border_width_left = 2
	style.border_width_top = 2
	style.border_width_right = 2
	style.border_width_bottom = 2
	style.corner_radius_top_left = 3
	style.corner_radius_top_right = 3
	style.corner_radius_bottom_left = 3
	style.corner_radius_bottom_right = 3
	style.shadow_color = shadow_color
	style.shadow_size = 4
	style.shadow_offset = Vector2(2, 3)
	panel.add_theme_stylebox_override("panel", style)
	add_child(panel)
	return panel

func _make_stat_chip(pos: Vector2, dimensions: Vector2, font_color: Color) -> Label:
	var panel := Panel.new()
	panel.position = pos
	panel.size = dimensions
	var style := StyleBoxFlat.new()
	style.bg_color = Color(0.045, 0.105, 0.082, 0.94)
	style.border_color = Color(0.32, 0.54, 0.44, 0.78)
	style.border_width_left = 1
	style.border_width_top = 1
	style.border_width_right = 1
	style.border_width_bottom = 1
	style.corner_radius_top_left = 2
	style.corner_radius_top_right = 2
	style.corner_radius_bottom_left = 2
	style.corner_radius_bottom_right = 2
	panel.add_theme_stylebox_override("panel", style)
	add_child(panel)

	var label := _make_label(pos + Vector2(8, 1), dimensions - Vector2(16, 2), 11, font_color)
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	return label

func _add_accent(pos: Vector2, dimensions: Vector2, color: Color) -> ColorRect:
	var accent := ColorRect.new()
	accent.position = pos
	accent.size = dimensions
	accent.color = color
	add_child(accent)
	return accent

func _make_label(pos: Vector2, dimensions: Vector2, font_size: int, font_color: Color) -> Label:
	var label := Label.new()
	label.position = pos
	label.size = dimensions
	label.add_theme_font_size_override("font_size", font_size)
	label.add_theme_color_override("font_color", font_color)
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(label)
	return label
