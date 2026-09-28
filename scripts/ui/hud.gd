extends CanvasLayer

var title_label: Label
var objective_label: Label
var inventory_label: Label
var trust_label: Label
var message_label: Label
var hint_label: Label

func build_ui() -> void:
	_add_panel(Vector2(12, 6), Vector2(620, 88), Color(0.03, 0.08, 0.06, 0.78))
	_add_panel(Vector2(638, 6), Vector2(310, 66), Color(0.03, 0.08, 0.06, 0.72))
	_add_panel(Vector2(12, 476), Vector2(936, 56), Color(0.03, 0.08, 0.06, 0.88))

	title_label = _make_label(Vector2(18, 12), Vector2(520, 28), 20)
	objective_label = _make_label(Vector2(18, 41), Vector2(620, 25), 16)
	inventory_label = _make_label(Vector2(18, 68), Vector2(210, 22), 14)
	trust_label = _make_label(Vector2(230, 68), Vector2(210, 22), 14)
	hint_label = _make_label(Vector2(620, 450), Vector2(320, 24), 15)
	message_label = _make_label(Vector2(24, 484), Vector2(912, 44), 15)

	var help := _make_label(Vector2(650, 14), Vector2(290, 52), 13)
	help.text = "Move: arrows / WASD\nInteract: Enter / Space   Save: F5   Load: F9"

func refresh(title: String, objective: String, part_count: int, trust: int, message: String, hint: String) -> void:
	title_label.text = title
	objective_label.text = objective
	inventory_label.text = "Repair parts: %d / 4" % part_count
	trust_label.text = "Village trust: %d" % trust
	message_label.text = message
	hint_label.text = hint

func _add_panel(pos: Vector2, dimensions: Vector2, color: Color) -> void:
	var panel := ColorRect.new()
	panel.position = pos
	panel.size = dimensions
	panel.color = color
	add_child(panel)

func _make_label(pos: Vector2, dimensions: Vector2, font_size: int) -> Label:
	var label := Label.new()
	label.position = pos
	label.size = dimensions
	label.add_theme_font_size_override("font_size", font_size)
	label.add_theme_color_override("font_color", Color("eef7e8"))
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(label)
	return label
