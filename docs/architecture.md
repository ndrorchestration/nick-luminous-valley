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

`project.godot` launches `scenes/world/main.tscn`, which attaches `scripts/world/main.gd`.

The vertical-slice runtime is now split along boundaries required for the production-art phase:

- `data/vertical_slice.json` — objectives and interaction metadata
- `scripts/world/main.gd` — movement, interaction rules, quest-state orchestration, and composition
- `scripts/world/world_renderer.gd` — replaceable world presentation layer
- `scripts/ui/hud.gd` — player-facing HUD and interaction text
- `scripts/systems/save_store.gd` — persistence I/O boundary
- `tests/vertical_slice_smoke.gd` — machine-verifiable behavioral contract

Quest semantics intentionally remain owned by `main.gd` for now. The refactor separates the volatile presentation and I/O surfaces without changing the established stage model.

## Why the art-ready split exists

The original v2 controller owned movement, quest transitions, persistence, UI construction, and procedural drawing. That was acceptable for proving the loop, but production-art work would require repeated edits to the same gameplay controller.

The art-ready split creates three replacement seams:

1. world art can replace `world_renderer.gd` without changing quest logic;
2. UI styling can replace or extend `hud.gd` without changing gameplay state;
3. persistence changes can evolve behind `save_store.gd`.

This satisfies the previously documented refactor trigger: presentation had become a material obstacle to iteration.

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

`save_store.gd` owns file access and JSON decoding/encoding. `main.gd` owns interpretation of supported save fields and migration behavior.

## Content boundary

Objectives and interaction metadata live in `data/vertical_slice.json`. Do not build a general-purpose content framework until repeated gameplay demonstrates stable reusable structures.

## Presentation boundary

The current renderer remains procedural and is not production art. Its purpose is now explicitly transitional: preserve a machine-verifiable presentation while giving the art pass a replaceable surface.

## Verification boundary

CI establishes importability and scripted runtime behavior. It does not establish input feel, player comprehension, pacing, art quality, emotional effect, or fun.

## Next refactor trigger

Move quest-state semantics out of `main.gd` only when:
1. a second playable quest creates repeated transition logic; or
2. quest behavior itself becomes difficult to test or author in the current controller.

Do not generalize beyond demonstrated reuse.
