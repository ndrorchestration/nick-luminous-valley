extends CanvasLayer

var title_label: Label
var objective_label: Label
var inventory_label: Label
var trust_label: Label
var message_label: Label
var hint_label: Label
var hint_panel: Panel

func build_ui() -> void:
	_add_panel(Vector2(12, 6), Vector2(574, 76), Color(0.025, 0.07, 0.055, 0.92), Color("78bfae"))
	_add_panel(Vector2(598, 6), Vector2(350, 58), Color(0.025, 0.07, 0.055, 0.86), Color("718f9b"))
	_add_panel(Vector2(12, 484), Vector2(936, 48), Color(0.025, 0.06, 0.05, 0.94), Color("c0a864"))
	hint_panel = _add_panel(Vector2(648, 448), Vector2(300, 30), Color(0.04, 0.12, 0.09, 0.94), Color("8bd9ba"))

	title_label = _make_label(Vector2(22, 12), Vector2(540, 22), 18, Color("f5e7a9"))
	objective_label = _make_label(Vector2(22, 37), Vector2(548, 21), 15, Color("d8eee5"))
	inventory_label = _make_label(Vector2(22, 60), Vector2(190, 18), 13, Color("e8cf83"))
	trust_label = _make_label(Vector2(215, 60), Vector2(180, 18), 13, Color("9ddbb5"))
	hint_label = _make_label(Vector2(660, 454), Vector2(276, 18), 14, Color("e9fff5"))
	message_label = _make_label(Vector2(26, 492), Vector2(904, 32), 14, Color("f5f0d8"))

	var help := _make_label(Vector2(610, 14), Vector2(326, 40), 12, Color("b9cbc6"))
	help.text = "Move: WASD / arrows   •   Enter: interact\nF5: save   •   F9: load"

func refresh(title: String, objective: String, part_count: int, trust: int, message: String, hint: String) -> void:
	title_label.text = title
	objective_label.text = objective
	inventory_label.text = "Repair parts: %d / 4" % part_count
	trust_label.text = "Village trust: %d" % trust
	message_label.text = message
	hint_label.text = hint
	hint_panel.visible = not hint.is_empty()

func _add_panel(pos: Vector2, dimensions: Vector2, color: Color, border_color: Color) -> Panel:
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
	style.corner_radius_top_left = 4
	style.corner_radius_top_right = 4
	style.corner_radius_bottom_left = 4
	style.corner_radius_bottom_right = 4
	panel.add_theme_stylebox_override("panel", style)
	add_child(panel)
	return panel

func _make_label(pos: Vector2, dimensions: Vector2, font_size: int, font_color: Color) -> Label:
	var label := Label.new()
	label.position = pos
	label.size = dimensions
	label.add_theme_font_size_override("font_size", font_size)
	label.add_theme_color_override("font_color", font_color)
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(label)
	return label
