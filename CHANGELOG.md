# Changelog

## Evidence-driven visual remediation — merged 2026-09-28

Main commit: `e1148324764d056556c67b04e2dcf134254d52ca`

### Changed
- added cohesive full-field village base terrain/path layer
- connected previously isolated visual zones
- increased character, pickup, station, and tower draw scale
- added grounding shadows
- removed duplicate tower rendering
- strengthened tower signal effect
- compacted HUD proportions
- preserved garden before/after contrast

### Verified
- Godot Smoke #36502420186 — PASS
- Windows Playtest Build #36502420202 — PASS
- Visual Evidence Capture #36502420148 — PASS
- visual artifact #11005544111

## Rendered visual evidence infrastructure — merged 2026-09-28

Main commit: `0de3f835c7c07ec0ff991e918b3a60dfc92635af`

### Added
- deterministic rendered checkpoint capture
- four visual evidence frames
- artifact verification/upload
- rendered-review documentation path

### Verified
- Godot Smoke #36501775952 — PASS
- Windows Playtest Build #36501775882 — PASS
- Visual Evidence Capture #36501775914 — PASS


## Complete first authored visual candidate set — merged 2026-09-28

Main commit: `8deace2bc28019c64de5ba4f4af1fa7ee07d2a9d`

### Added
- copper wire candidate
- cracked solar cell candidate
- pipe fitting candidate
- resin candidate
- lab bench candidate
- garden pump candidate
- transmission tower candidate
- bordered HUD hierarchy
- dedicated interaction prompt treatment

### State
- 16/16 current visual manifest slots populated
- machine-integrated candidate only
- human visual acceptance still pending

### Verified
- Godot Smoke #36501323308 — PASS
- Windows Playtest Build #36501323360 — PASS

## First authored environment candidate pass — merged 2026-09-28

Main commit: `f50ccba414aa7bcd9ab02fadb6187f630751adb7`

### Added
- workshop yard
- village green
- grandfather's lab
- creek / salvage path
- garden before repair
- garden after repair

### Verified
- Godot Smoke #36501057566 — PASS
- Windows Playtest Build #36501057490 — PASS

## First authored character candidate pass — merged 2026-09-28

Main commit: `2c7d431825a820503b0d1c8e9360b5f8abe4ac2d`

### Added
- Nick field sprite candidate
- Mira field sprite candidate
- Sora field sprite candidate

### Verified
- Godot Smoke #36500826480 — PASS
- Windows Playtest Build #36500826416 — PASS

## Incremental production-art ingestion — merged 2026-09-28

Main commit: `4b6bcaa6a1628b4578926e550aa8078a42bbc9e1`

### Added
- versioned visual asset manifest
- safe texture loader
- per-slot art replacement hooks
- procedural fallback for missing assets
- asset-ingestion contract
- runtime asset-layout documentation

### Verified
- Godot Smoke #36500157438 — PASS
- Windows Playtest Build #36500157460 — PASS

## Art-ready runtime refactor — merged 2026-09-28

Main commit: `87cc62a72c56493e72b1fe7a486b465851011887`

### Added / separated
- dedicated HUD presentation component
- dedicated world-renderer presentation component
- dedicated persistence I/O component

### Verified
- Godot Smoke #36499794753 — PASS
- Windows Playtest Build #36499794719 — PASS

## CI efficiency — merged 2026-09-28

Main commit: `2f009f3819796123ab6044e448ce34826ee82d2c`

### Verified
- Godot Smoke #36496591783 — PASS
- Windows Playtest Build #36496591715 — PASS

## Windows playtest packaging — merged 2026-09-28

Main commit: `468d3215aa12b6a950ad83ed91651dffc63081a2`

### Verified
- GitHub Actions run #36496236186 — PASS

## Vertical slice v2 — merged 2026-09-28

Main commit: `e2529d610e029df4c4f8e061bb7029bb4b83a6d5`

### Verified
- Godot 4.7.2 run #36494912875 — PASS

## Foundation

Machine-verified bootstrap merged to `main` at `0bd1ff387415f4e599e8166615c12d82d69cf218`.
