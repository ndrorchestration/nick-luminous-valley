# Changelog

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
