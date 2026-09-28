# Verification Ledger

## Foundation evidence

Environment: Godot 4.7.2 on GitHub Actions  
Run: **#36493110377**  
Result: **PASS**

Established for the bootstrap:
- project import
- main-scene launch
- quest progression
- incomplete-repair gate
- four-part collection
- pump/world-state transition
- tower completion
- save/load restoration

Foundation merged to `main` at commit `0bd1ff387415f4e599e8166615c12d82d69cf218`.

## Vertical-slice v2 evidence

Environment: Godot 4.7.2 on GitHub Actions

Implementation run: **#36494569694 — PASS**  
Final branch-head run: **#36494912875 — PASS**

Established for v2:
- project import
- main-scene launch
- JSON content loading
- nine interaction points available
- Mira stage transition
- Sora stage transition
- three-part incomplete state
- missing-part lab rejection
- fourth-part completion
- lab repair transition
- pump installation
- persistent world-state change
- village-trust increase
- tower completion
- save/load restoration including trust and position

Vertical-slice v2 merged to `main` at commit:

`e2529d610e029df4c4f8e061bb7029bb4b83a6d5`

## Windows packaging evidence

Environment: Godot 4.7.2 + export templates on GitHub Actions  
Run: **#36496236186**  
Result: **PASS**

Established:
- project import before packaging
- vertical-slice acceptance before packaging
- Windows Desktop export succeeds
- `NicksLuminousValley.exe` exists after export
- artifact upload succeeds
- artifact ID: `11003955591`
- artifact size: `38,936,427` bytes
- artifact digest: `sha256:20dedfc3f8b60c61e044bb957093fb93e21433363443500e30507e487fb527da`
- packaging pipeline merged to `main` at `468d3215aa12b6a950ad83ed91651dffc63081a2`

Packaging evidence establishes reproducible build generation, not interactive play quality.

## Art-ready runtime refactor evidence

Environment: Godot 4.7.2 on GitHub Actions

Godot Smoke run: **#36499794753 — PASS**  
Windows Playtest Build run: **#36499794719 — PASS**

Established:
- HUD extraction preserves runtime composition
- world renderer extraction preserves gameplay presentation path
- save-store extraction preserves save/load behavior
- existing quest-state transitions remain unchanged
- project import remains green
- main-scene launch remains green
- vertical-slice acceptance remains green
- Windows export remains green

Merged to `main` at:

`87cc62a72c56493e72b1fe7a486b465851011887`

This establishes a technically verified replacement seam for visual/UI/persistence iteration. It does not establish production-art quality or human acceptance.

## Not established

Automated CI does **not** establish:
- input feel
- visual readability in a real game window
- pacing
- player comprehension without coaching
- emotional impact
- fun
- production-art quality
- external-player acceptance

These require interactive human play. See issue #7 and `docs/playtest-template.md`.
