# Architecture

## Authority

This file is the canonical technical architecture. `docs/vertical-slice.md` defines required player behavior, `docs/content-model.md` defines current content data, and `docs/decision-log.md` records why important choices were made.

## Stack

- Godot 4.x; CI reference version: Godot 4.7.2
- GDScript
- Git + GitHub
- GitHub Actions for headless runtime verification
- text-first scenes, scripts, JSON content, and documentation

## Current runtime shape

`project.godot` launches `scenes/world/main.tscn`, which currently attaches `scripts/world/main.gd`.

The v2 slice deliberately keeps one world controller while the experience is still small. It now separates content from behavior:

- `data/vertical_slice.json` — objectives, interaction-point identity, labels, hints, and positions
- `scripts/world/main.gd` — movement, interaction rules, state transitions, UI, procedural presentation, save/load
- `tests/vertical_slice_smoke.gd` — machine-verifiable behavioral contract

This is a controlled intermediate architecture, not the intended final game structure.

## State model

Persistent state currently includes:
- save version
- quest stage
- collected repair components
- garden/world-change state
- village trust
- player position

The runtime quest path remains monotonic from stage 0 through stage 5.

## Save contract

Current version: **2**

Path: `user://nick_luminous_valley_save.json`

The loader:
- accepts legacy version 1 data
- rejects saves from a future unsupported version
- clamps quest stage to the currently supported range
- restores missing village-trust state from legacy world state

## Content boundary

The first data extraction is established because objectives and interaction metadata are reused by both player-facing presentation and acceptance tests. Do not build a general-purpose content framework yet.

## Presentation boundary

The v2 world uses procedural Godot drawing rather than production art. This is intentional: world zones, affordances, feedback, and state changes can now be judged before committing to an asset pipeline.

## Verification boundary

CI establishes importability and scripted runtime behavior. It does not establish input feel, player comprehension, pacing, art quality, emotional effect, or fun.

## Refactor trigger

Split `main.gd` into dedicated player, quest, UI, persistence, and world-presentation components when either:
1. a second playable quest introduces duplicated responsibilities, or
2. the current controller becomes a material obstacle to testing or iteration.

Refactor because a boundary is demonstrated, not because abstraction is aesthetically attractive.
