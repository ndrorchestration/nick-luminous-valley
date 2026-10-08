# Project Status

Date: 2026-10-08

## Main

Current merged `main` is the JRPG HUD v2 presentation baseline at:

`c4385a45c7892600069ead6d4f85a13030585106`

The earlier rendered-remediation baseline was merged at `e1148324764d056556c67b04e2dcf134254d52ca`; it is no longer the latest main head.

The `art/nick-directional-field-v1` worktree is a separate **candidate**, not merged, human-approved, or live-verified. It adds three cardinal facing poses while retaining the original front pose, existing interactions, save shape, and visual manifest schema 1.

Supporting milestones:
- Windows-playtest packaging: `468d3215aa12b6a950ad83ed91651dffc63081a2`
- Vertical-slice v2 gameplay baseline: `e2529d610e029df4c4f8e061bb7029bb4b83a6d5`
- CI trigger optimization: `2f009f3819796123ab6044e448ce34826ee82d2c`
- Art-ready runtime refactor: `87cc62a72c56493e72b1fe7a486b465851011887`
- Incremental production-art ingestion: `4b6bcaa6a1628b4578926e550aa8078a42bbc9e1`
- Character candidate pass: `2c7d431825a820503b0d1c8e9360b5f8abe4ac2d`
- Environment candidate pass: `f50ccba414aa7bcd9ab02fadb6187f630751adb7`
- Complete first authored candidate set: `8deace2bc28019c64de5ba4f4af1fa7ee07d2a9d`
- Rendered visual evidence infrastructure: `0de3f835c7c07ec0ff991e918b3a60dfc92635af`
- First evidence-driven visual remediation: `e1148324764d056556c67b04e2dcf134254d52ca`

## Current capabilities

- controllable top-down player
- interaction proximity system
- Mira and Sora progression
- four recoverable repair components
- incomplete-repair rejection
- lab repair completion
- pump installation
- persistent garden state
- village-trust state
- transmission-tower narrative endpoint
- versioned save/load
- data-driven objective and interaction metadata
- named world zones
- dedicated HUD presentation boundary
- dedicated world-renderer presentation boundary
- dedicated save-store I/O boundary
- versioned visual-asset manifest
- safe per-slot texture loading
- procedural fallback for partial art sets
- **17/17 current visual slots populated with authored candidate assets**, including a cohesive world-base layer
- authored Nick, Mira, and Sora field sprites
- authored workshop, village green, lab, creek, and garden before/after environment candidates
- authored four pickups, lab bench, pump, and transmission tower
- bordered HUD hierarchy and dedicated interaction prompt treatment
- coherent world-base paths connecting the five authored zones
- larger grounded characters/props
- duplicate tower rendering removed
- deterministic rendered visual-evidence capture
- reproducible Windows Desktop export
- runtime-only CI path filters and superseded-run cancellation

## Verification

Gameplay baseline:
- Godot 4.7.2 run **#36494912875 — PASS**

Windows packaging:
- **#36496236186 — PASS**

Art-ready runtime refactor:
- Godot Smoke **#36499794753 — PASS**
- Windows Playtest Build **#36499794719 — PASS**

Asset-ingestion mechanism:
- Godot Smoke **#36500157438 — PASS**
- Windows Playtest Build **#36500157460 — PASS**

Character candidate pass:
- Godot Smoke **#36500826480 — PASS**
- Windows Playtest Build **#36500826416 — PASS**

Environment candidate pass:
- Godot Smoke **#36501057566 — PASS**
- Windows Playtest Build **#36501057490 — PASS**

Complete first authored visual candidate set:
- Godot Smoke **#36501323308 — PASS**
- Windows Playtest Build **#36501323360 — PASS**

Rendered evidence infrastructure:
- Godot Smoke **#36501775952 — PASS**
- Windows Playtest Build **#36501775882 — PASS**
- Visual Evidence Capture **#36501775914 — PASS**
- baseline artifact **#11005607995**

Evidence-driven visual remediation:
- Godot Smoke **#36502420186 — PASS**
- Windows Playtest Build **#36502420202 — PASS**
- Visual Evidence Capture **#36502420148 — PASS**
- remediation artifact **#11005544111**

This establishes machine integration, runtime compatibility, reproducible packaging, and deterministic rendered evidence for the current visual candidate. Rendered review shows materially improved spatial cohesion, entity grounding, field scale, HUD proportion, and tower treatment.

## Current gate

**Human interactive and visual acceptance are NOT ESTABLISHED.**

Issue #7 remains the primary player-experience gate.

Issues #13, #14, and #15 remain open because their authored visual candidates have not yet been reviewed in a visible game window.

Machine verification does not establish:
- visual appeal
- JRPG/cozy identity
- visual hierarchy
- field readability
- pacing
- player comprehension
- emotional impact
- fun
- style cohesion

## Next development order

1. Run the current Windows build in a visible window.
2. Complete issue #7 human interactive acceptance.
3. Review issues #13–#15 against `docs/visual-direction.md`.
4. Continue evidence-driven visual refinement (directional field animation and atmospheric motion are the next technical candidates).
5. External playtest.
6. Add a second invention loop only if the core loop and presentation earn expansion.

## Explicit non-claims

The project does not yet claim:
- accepted production visual quality
- fun
- market readiness
- complete farming systems
- complete JRPG systems
- content-complete demo status
