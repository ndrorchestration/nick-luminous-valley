# Asset Ingestion Contract

## Purpose

Allow production art to replace procedural presentation incrementally without changing quest/state code or making partial art sets unplayable.

## Authority

`data/visual_assets.json` is the current runtime asset-slot manifest.

Schema version: **1**

The manifest is interpreted by:
- `scripts/world/asset_catalog.gd`
- `scripts/world/world_renderer.gd`

## Fallback rule

Every slot is optional.

If a slot path is empty, missing, or cannot be loaded as a texture, the renderer must use the existing procedural fallback for that element.

This is intentional: a partial visual pass must remain runnable.

Directional Nick poses are optional. If the selected `player_back`, `player_left`, or `player_right` slot fails to load, render `player` instead; retain the procedural circle if the frontal asset is also absent. This preserves existing saves, movement and manifest schema version 1.

## Current slots

### Characters / entities
- `player` (Nick facing down; backward-compatible fallback)
- `player_back` (Nick facing up)
- `player_left` (Nick facing left)
- `player_right` (Nick facing right)
- `mira`
- `sora`

### Pickups
- `wire`
- `solar`
- `pipe`
- `resin`

### Stations / props
- `lab`
- `pump`
- `tower`

### Environment
- `zone_workshop`
- `zone_green`
- `zone_lab`
- `zone_creek`
- `garden_before`
- `garden_after`

## Entry fields

### path
Godot resource path, for example:

`res://assets/art/characters/nick_idle.png`

Leave empty until the asset actually exists.

### size
Optional target draw size for centered character/entity sprites.

Example:

`[32, 32]`

### rect
Optional draw rectangle for environment textures.

Example:

`[38, 108, 250, 142]`

## Art iteration workflow

1. Create or import one runtime-ready asset.
2. Place it under `assets/art/`.
3. Update only the relevant manifest slot.
4. Run Godot Smoke.
5. Run or inspect the Windows playtest build.
6. Compare against `docs/visual-direction.md`.
7. Keep or revise the asset without touching quest semantics.

## Constraints

- Do not point the manifest at editable source masters such as large layered working files.
- Keep runtime-ready assets small and deterministic.
- Preserve nearest-neighbor / pixel-art import behavior where appropriate.
- Do not silently replace multiple unrelated slots in one visual experiment.
- A loading PASS does not establish visual quality; human visible-window review remains required.
