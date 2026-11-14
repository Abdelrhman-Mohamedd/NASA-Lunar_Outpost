class_name UiKit
extends RefCounted
## Sci-fi cosmic purple & golden-amber UI theme with 45-degree chamfered corners
## (corner_detail = 1 on StyleBoxFlat produces sharp angled sci-fi corners).

const FONT_BODY := 16
const FONT_SMALL := 14
const FONT_TITLE := 22

const COLOR_BG_DEEP := Color(0.05, 0.02, 0.11, 0.97)      # #0d051c
const COLOR_PANEL := Color(0.08, 0.04, 0.16, 0.96)        # #140a29
const COLOR_ROW := Color(0.15, 0.09, 0.28, 0.95)          # #261747
const COLOR_SIDE_SELECTED := Color(0.25, 0.23, 0.36, 1.0) # #403b5c
const COLOR_BORDER := Color(0.45, 0.18, 0.96, 1.0)        # #732ef5 neon purple
const COLOR_BORDER_DIM := Color(0.32, 0.14, 0.68, 1.0)    # #5224ad
const COLOR_GOLD := Color(0.96, 0.72, 0.02, 1.0)          # #f5b805 golden button
const COLOR_GOLD_HOVER := Color(1.0, 0.82, 0.22, 1.0)
const COLOR_TEXT := Color(0.95, 0.94, 1.0, 1.0)
const COLOR_MUTED := Color(0.62, 0.57, 0.76, 1.0)
const COLOR_ACCENT := Color(0.65, 0.44, 1.0, 1.0)
const COLOR_GOOD := Color(0.42, 0.95, 0.68, 1.0)
const COLOR_BAD := Color(1.0, 0.45, 0.52, 1.0)
const COLOR_WARN := Color(0.98, 0.78, 0.22, 1.0)


## Angled 45-degree chamfered sci-fi panel (corner_detail = 1).
static func panel_style(
	bg: Color = COLOR_PANEL,
	border: Color = COLOR_BORDER,
	margin: int = 16,
	chamfer: int = 12,
	border_w: int = 2
) -> StyleBoxFlat:
	var st := StyleBoxFlat.new()
	st.bg_color = bg
	st.set_border_width_all(border_w)
	st.border_color = border
	st.set_corner_radius_all(chamfer)
	st.corner_detail = 1
	st.content_margin_left = margin
	st.content_margin_right = margin
	st.content_margin_top = maxi(6, margin - 4)
	st.content_margin_bottom = maxi(6, margin - 4)
	return st


## Top tab style with chamfered top corners and flat bottom.
static func tab_style(active: bool) -> StyleBoxFlat:
	var st := StyleBoxFlat.new()
	st.bg_color = COLOR_PANEL if active else Color(0.06, 0.03, 0.12, 0.9)
	st.border_width_top = 2
	st.border_width_left = 2
	st.border_width_right = 2
	st.border_width_bottom = 0 if active else 2
	st.border_color = COLOR_BORDER if active else COLOR_BORDER_DIM
	st.corner_radius_top_left = 10
	st.corner_radius_top_right = 10
	st.corner_radius_bottom_left = 0
	st.corner_radius_bottom_right = 0
	st.corner_detail = 1
	st.content_margin_left = 16
	st.content_margin_right = 16
	st.content_margin_top = 8
	st.content_margin_bottom = 8
	return st


## Golden CTA button matching the reference screenshot ("SEND", "SELECT ON MAP", "RESEARCH").
static func gold_button(text: String, size: int = 14, min_size: Vector2 = Vector2(100, 34)) -> Button:
	var btn := Button.new()
	btn.text = text.to_upper()
	btn.custom_minimum_size = min_size
	btn.focus_mode = Control.FOCUS_ALL
	btn.add_theme_font_size_override("font_size", size)
	btn.add_theme_color_override("font_color", Color(0.08, 0.04, 0.14, 1.0))
	btn.add_theme_color_override("font_hover_color", Color(0.05, 0.02, 0.1, 1.0))
	btn.add_theme_color_override("font_pressed_color", Color(0.05, 0.02, 0.1, 1.0))
	btn.add_theme_color_override("font_disabled_color", Color(0.55, 0.5, 0.68, 0.85))

	var normal := StyleBoxFlat.new()
	normal.bg_color = COLOR_GOLD
	normal.set_corner_radius_all(4)
	normal.corner_detail = 1
	normal.content_margin_left = 12
	normal.content_margin_right = 12
	normal.content_margin_top = 5
	normal.content_margin_bottom = 5

	var hover := normal.duplicate() as StyleBoxFlat
	hover.bg_color = COLOR_GOLD_HOVER

	var disabled := normal.duplicate() as StyleBoxFlat
	disabled.bg_color = Color(0.20, 0.15, 0.30, 0.9)
	disabled.set_border_width_all(1)
	disabled.border_color = COLOR_BORDER_DIM

	btn.add_theme_stylebox_override("normal", normal)
	btn.add_theme_stylebox_override("hover", hover)
	btn.add_theme_stylebox_override("pressed", hover)
	btn.add_theme_stylebox_override("disabled", disabled)
	return btn


## Dark-purple chamfered button with neon-violet border.
static func button(text: String, size: int = FONT_BODY, min_size: Vector2 = Vector2(0, 42)) -> Button:
	var btn := Button.new()
	btn.text = text
	btn.add_theme_font_size_override("font_size", size)
	btn.custom_minimum_size = min_size
	btn.focus_mode = Control.FOCUS_ALL
	btn.add_theme_color_override("font_color", COLOR_TEXT)
	btn.add_theme_color_override("font_hover_color", COLOR_GOLD_HOVER)
	btn.add_theme_color_override("font_disabled_color", COLOR_MUTED)

	var normal := panel_style(COLOR_ROW, COLOR_BORDER, 12, 6, 2)
	var hover := panel_style(Color(0.22, 0.12, 0.40, 1.0), COLOR_GOLD, 12, 6, 2)
	var disabled := panel_style(Color(0.10, 0.06, 0.18, 0.8), COLOR_BORDER_DIM, 12, 6, 1)

	btn.add_theme_stylebox_override("normal", normal)
	btn.add_theme_stylebox_override("hover", hover)
	btn.add_theme_stylebox_override("pressed", hover)
	btn.add_theme_stylebox_override("disabled", disabled)
	return btn


static func close_circle_button() -> Button:
	var btn := Button.new()
	btn.text = "X"
	btn.custom_minimum_size = Vector2(32, 32)
	btn.add_theme_font_size_override("font_size", 15)
	btn.add_theme_color_override("font_color", COLOR_TEXT)
	var st := StyleBoxFlat.new()
	st.bg_color = Color(0.32, 0.28, 0.40, 1.0)
	st.set_corner_radius_all(16)
	st.set_border_width_all(1)
	st.border_color = COLOR_BORDER
	var hov := st.duplicate() as StyleBoxFlat
	hov.bg_color = Color(0.48, 0.25, 0.58, 1.0)
	btn.add_theme_stylebox_override("normal", st)
	btn.add_theme_stylebox_override("hover", hov)
	btn.add_theme_stylebox_override("pressed", hov)
	return btn


static func label(text: String, size: int = FONT_BODY, color: Color = COLOR_TEXT, wrap: bool = true) -> Label:
	var lbl := Label.new()
	lbl.text = text
	lbl.add_theme_font_size_override("font_size", size)
	lbl.add_theme_color_override("font_color", color)
	if wrap:
		lbl.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		lbl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	return lbl


static func make_overlay(card_width: float = 820.0) -> Array:
	var overlay := Control.new()
	overlay.set_anchors_preset(Control.PRESET_FULL_RECT)
	overlay.mouse_filter = Control.MOUSE_FILTER_STOP
	var dim := ColorRect.new()
	dim.set_anchors_preset(Control.PRESET_FULL_RECT)
	dim.color = Color(0.03, 0.01, 0.07, 0.80)
	dim.mouse_filter = Control.MOUSE_FILTER_IGNORE
	overlay.add_child(dim)
	var center := CenterContainer.new()
	center.set_anchors_preset(Control.PRESET_FULL_RECT)
	center.mouse_filter = Control.MOUSE_FILTER_IGNORE
	overlay.add_child(center)
	var outer := PanelContainer.new()
	outer.custom_minimum_size = Vector2(card_width, 0)
	outer.add_theme_stylebox_override("panel", panel_style(COLOR_BG_DEEP, COLOR_BORDER, 8, 14, 2))
	center.add_child(outer)
	var inner := PanelContainer.new()
	inner.add_theme_stylebox_override("panel", panel_style(COLOR_PANEL, COLOR_BORDER_DIM, 20, 10, 2))
	outer.add_child(inner)
	var box := VBoxContainer.new()
	box.add_theme_constant_override("separation", 10)
	inner.add_child(box)
	return [overlay, box]


static func clear_children(node: Node) -> void:
	for child in node.get_children():
		node.remove_child(child)
		child.queue_free()


static func stars(filled: int, total: int, sep: String = " ") -> String:
	var parts: Array[String] = []
	for i in range(total):
		parts.append("[*]" if i < filled else "[ ]")
	var joiner := " " if sep == "" else sep
	return joiner.join(parts)


static func icon_badge(kind: String, col: Color) -> Control:
	var b := _VectorBadge.new(kind, col)
	b.custom_minimum_size = Vector2(22, 20)
	b.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return b


class _VectorBadge extends Control:
	var kind: String
	var col: Color

	func _init(k: String, c: Color) -> void:
		kind = k
		col = c

	func _draw() -> void:
		var c := Vector2(size.x * 0.5, size.y * 0.5)
		match kind:
			"battery":
				draw_colored_polygon(PackedVector2Array([
					c + Vector2(1, -8), c + Vector2(-5, 1), c + Vector2(0, 1),
					c + Vector2(-2, 8), c + Vector2(5, -1), c + Vector2(0, -1),
				]), col)
			"oxygen":
				draw_arc(c + Vector2(-2, 1), 3.8, 0.0, TAU, 16, col, 1.8)
				draw_arc(c + Vector2(4, -3), 2.6, 0.0, TAU, 14, col, 1.6)
				draw_arc(c + Vector2(3, 4), 2.0, 0.0, TAU, 12, col, 1.5)
			"food", "crop":
				draw_line(c + Vector2(0, 7), c + Vector2(0, -3), col, 2.0)
				draw_colored_polygon(PackedVector2Array([
					c + Vector2(0, 1), c + Vector2(-6, -3), c + Vector2(-2, -6),
				]), col)
				draw_colored_polygon(PackedVector2Array([
					c + Vector2(0, -1), c + Vector2(6, -5), c + Vector2(2, -8),
				]), col)
			"water":
				draw_colored_polygon(PackedVector2Array([
					c + Vector2(0, -7), c + Vector2(-5, 2), c + Vector2(5, 2),
				]), col)
				draw_circle(c + Vector2(0, 2.5), 5.0, col)
			"shield":
				var pts := PackedVector2Array([
					c + Vector2(0, -8), c + Vector2(6, -5), c + Vector2(5, 2),
					c + Vector2(0, 8), c + Vector2(-5, 2), c + Vector2(-6, -5),
				])
				draw_colored_polygon(pts, Color(col.r, col.g, col.b, 0.35))
				pts.append(pts[0])
				draw_polyline(pts, col, 1.8)
			"sun":
				draw_circle(c, 3.8, col)
				for i in range(8):
					var a := float(i) * TAU / 8.0
					var d := Vector2(cos(a), sin(a))
					draw_line(c + d * 5.2, c + d * 7.8, col, 1.6)
			"science":
				var pts := PackedVector2Array([
					c + Vector2(-2, -7), c + Vector2(2, -7), c + Vector2(2, -3),
					c + Vector2(6, 6), c + Vector2(-6, 6), c + Vector2(-2, -3),
				])
				draw_colored_polygon(pts, Color(col.r, col.g, col.b, 0.35))
				pts.append(pts[0])
				draw_polyline(pts, col, 1.8)
			"pause":
				draw_rect(Rect2(c + Vector2(-5, -6), Vector2(3.5, 12)), col, true)
				draw_rect(Rect2(c + Vector2(1.5, -6), Vector2(3.5, 12)), col, true)
			"wrench":
				draw_line(c + Vector2(-5, 5), c + Vector2(3, -3), col, 2.6)
				draw_arc(c + Vector2(4, -4), 3.2, 0.5, 4.8, 12, col, 2.0)
			"alert":
				draw_colored_polygon(PackedVector2Array([
					c + Vector2(0, -8), c + Vector2(7, 6), c + Vector2(-7, 6),
				]), col)
				draw_line(c + Vector2(0, -3), c + Vector2(0, 2), COLOR_BG_DEEP, 2.0)
				draw_circle(c + Vector2(0, 4.2), 1.1, COLOR_BG_DEEP)
			"radar":
				draw_arc(c + Vector2(-1, 2), 5.0, PI * 0.75, PI * 1.75, 14, col, 2.0)
				draw_line(c + Vector2(-1, 2), c + Vector2(4, -3), col, 1.8)
				draw_arc(c + Vector2(2, -1), 4.5, -PI * 0.45, 0.1, 10, col, 1.5)
				draw_line(c + Vector2(-4, 7), c + Vector2(2, 7), col, 2.0)
			"chat":
				draw_rect(Rect2(c + Vector2(-6, -6), Vector2(12, 9)), col, false, 1.8)
				draw_colored_polygon(PackedVector2Array([
					c + Vector2(-3, 3), c + Vector2(1, 3), c + Vector2(-4, 7),
				]), col)
			"pod":
				draw_rect(Rect2(c + Vector2(-6, -6), Vector2(12, 12)), Color(col.r, col.g, col.b, 0.30), true)
				draw_rect(Rect2(c + Vector2(-6, -6), Vector2(12, 12)), col, false, 1.8)
				draw_line(c + Vector2(-6, 0), c + Vector2(6, 0), col, 1.5)
				draw_line(c + Vector2(0, -6), c + Vector2(0, 6), col, 1.5)
			_:
				draw_arc(c, 6.5, 0.0, TAU, 18, col, 1.8)
				draw_circle(c, 2.2, col)


static func is_left_click(event: InputEvent) -> bool:
	return event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed


static func is_click_or_touch(event: InputEvent) -> bool:
	return is_left_click(event) or (event is InputEventScreenTouch and event.pressed)
