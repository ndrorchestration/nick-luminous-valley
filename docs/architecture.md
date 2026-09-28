# Architecture

## Authority
This file is the canonical technical architecture for the current playable slice. `docs/vertical-slice.md` defines behavior; `docs/decision-log.md` records why choices were made.

## Current stack
- Godot 4.x
- GDScript
- Git + GitHub
- Text-first scenes/resources where practical
- Placeholder procedural visuals until the interaction loop is accepted

## Boundaries
- `scenes/` owns Godot scene composition.
- `scripts/` owns runtime behavior.
- `data/` will own content definitions once content volume justifies externalization.
- `assets/` will own art/audio/fonts.
- `docs/` owns canonical project decisions and acceptance criteria.
- `builds/` is local/export output and is not committed.

## Bootstrap implementation
The first implementation intentionally uses a single scene and a single world script to prove the loop before introducing abstractions. Refactor only after a second feature demonstrates a repeated responsibility.

## Save contract
The prototype persists quest stage, collected components, world-change state, and player position to `user://nick_luminous_valley_save.json`.

## AI contribution rule
AI-generated changes are proposals until they are executed in Godot and checked against explicit acceptance criteria. Runtime evidence outranks model confidence.
