# Data

The project now has its first established content-data boundary.

## Current authority

`vertical_slice.json` defines:
- current slice title
- ordered objective copy
- nine interaction points
- stable point IDs
- display names
- interaction kinds
- world positions
- interaction hints

Runtime behavior remains in GDScript.

## Why this boundary exists

The data is now reused by presentation, interaction logic, and automated verification. This makes extraction useful rather than speculative.

## Planned domains

Create additional domain files only when concrete gameplay requires them:
- `items/`
- `recipes/`
- `dialogue/`
- `quests/`

Do not create a generalized schema framework until repeated content demonstrates a stable shape.
