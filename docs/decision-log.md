# Decision Log

## 2026-09-28 — Engine and language
**Decision:** Godot 4.x with GDScript.
**Reason:** Fast 2D iteration, open-source tooling, text-friendly project files, and low infrastructure overhead.
**Deferred alternatives:** Unity, Unreal, custom engine, web-first runtime.

## 2026-09-28 — Vertical-slice scope
**Decision:** Build “Nick's First Spark: The Broken Water Pump” before expanding farming, JRPG, social, or infrastructure systems.
**Reason:** A complete small loop can be playtested and falsified; a broad feature inventory cannot.

## 2026-09-28 — Architecture authority
**Decision:** Keep one canonical `docs/architecture.md`.
**Reason:** Avoid competing technical source-of-truth documents across human and AI collaborators.

## 2026-09-28 — Bootstrap visuals
**Decision:** Use procedural placeholder shapes and labels first.
**Reason:** Validate interaction and state flow before spending effort on production art.

## 2026-09-28 — AI workflow
**Decision:** spec → small ticket → implementation plan → branch/patch → engine execution → playtest evidence → review/repair → accepted commit.
**Reason:** Makes observed runtime behavior the acceptance authority.
