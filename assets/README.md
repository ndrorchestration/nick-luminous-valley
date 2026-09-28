# Assets

Production art, audio, fonts, tilesets, portraits, and animation sources belong here.

## Current state

The project now has a runtime asset-ingestion contract while retaining procedural fallback presentation.

Authority:
- `data/visual_assets.json` — runtime visual slots
- `docs/asset-contract.md` — ingestion rules
- `docs/visual-direction.md` — art-direction and acceptance criteria

Empty or missing asset slots deliberately fall back to the verified procedural presentation.

## Recommended runtime structure

`assets/art/characters/` — player/NPC field sprites  
`assets/art/environment/` — zone and garden art  
`assets/art/props/` — pump, lab, tower, pickups  
`assets/art/ui/` — frames, icons, interaction treatments

Create subdirectories as concrete assets arrive; do not populate the repo with empty organizational scaffolding.

## Repository policy

- commit small runtime-ready assets normally
- use Git LFS for large editable source masters when size warrants it
- do not commit duplicate downloads, temporary renders, export folders, or local caches
- preserve source attribution and license information for third-party assets
- keep editable source masters separate from optimized runtime files when appropriate
