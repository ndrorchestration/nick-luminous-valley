# Changelog

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

### Preserved
- movement
- quest progression
- incomplete-repair gating
- component collection
- pump/world-state transition
- village-trust change
- tower completion
- save/load
- Windows packaging

### Verified
- Godot Smoke #36499794753 — PASS
- Windows Playtest Build #36499794719 — PASS


## CI efficiency — merged 2026-09-28

Main commit: `2f009f3819796123ab6044e448ce34826ee82d2c`

### Changed
- smoke CI now runs only for runtime-relevant paths
- Windows packaging now runs only for runtime/export-relevant paths
- documentation-only commits no longer trigger Godot or Windows export jobs
- superseded runs on the same ref are cancelled automatically

### Verified
- Godot Smoke run #36496591783 — PASS
- Windows Playtest Build run #36496591715 — PASS


## Windows playtest packaging — merged 2026-09-28

Main commit: `468d3215aa12b6a950ad83ed91651dffc63081a2`

### Added
- Windows Desktop export preset
- Godot 4.7.2 export-template packaging workflow
- pre-export vertical-slice acceptance
- exported executable existence check
- uploaded Windows playtest artifact
- Windows playtest documentation

### Verified
- GitHub Actions run #36496236186 — PASS
- artifact ID `11003955591`
- artifact digest `sha256:20dedfc3f8b60c61e044bb957093fb93e21433363443500e30507e487fb527da`


## Vertical slice v2 — merged 2026-09-28

Main commit: `e2529d610e029df4c4f8e061bb7029bb4b83a6d5`

### Added
- data-driven vertical-slice content
- named world zones
- proximity interaction prompts
- village-trust state
- animated garden and tower feedback
- save schema version 2
- expanded headless acceptance tests
- feature-branch CI
- project status, roadmap, content-model, and documentation index

### Changed
- stronger objective, inventory, trust, message, and help presentation
- clearer Broken Water Pump narrative copy
- garden state communicates recovery more explicitly
- contribution workflow separates CI evidence from human play evidence

### Verified
- Godot 4.7.2 run #36494569694 passed implementation acceptance
- Godot 4.7.2 run #36494912875 passed on the final v2 branch head

## Foundation

Machine-verified bootstrap merged to `main` at `0bd1ff387415f4e599e8166615c12d82d69cf218`.
