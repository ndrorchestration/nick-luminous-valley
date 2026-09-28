# Content Model

## Current file

`data/vertical_slice.json`

## Top-level fields

### title
Player-facing title for the current slice.

### objectives
Ordered array indexed by quest stage 0–5.

### points
Array of interaction-point records.

Each point currently contains:
- `id` — stable runtime identity
- `name` — player-facing name
- `kind` — `npc`, `item`, or `station`
- `pos` — two-number world position
- `hint` — proximity interaction prompt

## Runtime responsibilities

The data model does **not** decide:
- stage-transition rules
- inventory mutation
- repair requirements
- trust changes
- persistence rules
- visual rendering

Those remain behavior and belong in code.

## Stability policy

IDs are persistence-/test-sensitive and should not be renamed casually.

Display names, hint copy, and coordinates may evolve during playtesting.

New fields should be introduced only when an actual runtime or authoring need exists.
