extends RefCounted

static func load_manifest(path: String) -> Dictionary:
	var raw := FileAccess.get_file_as_string(path)
	var parsed = JSON.parse_string(raw)
	if typeof(parsed) != TYPE_DICTIONARY:
		return {"schema_version": 0, "slots": {}}
	return parsed

static func texture_from_entry(entry: Dictionary) -> Texture2D:
	var path := str(entry.get("path", ""))
	if path.is_empty() or not ResourceLoader.exists(path):
		return null
	var resource = load(path)
	return resource as Texture2D

static func size_from_entry(entry: Dictionary, fallback: Vector2) -> Vector2:
	var raw = entry.get("size", [])
	if raw is Array and raw.size() >= 2:
		return Vector2(float(raw[0]), float(raw[1]))
	return fallback

static func rect_from_entry(entry: Dictionary, fallback: Rect2) -> Rect2:
	var raw = entry.get("rect", [])
	if raw is Array and raw.size() >= 4:
		return Rect2(float(raw[0]), float(raw[1]), float(raw[2]), float(raw[3]))
	return fallback
