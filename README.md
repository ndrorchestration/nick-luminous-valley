# Nick's Luminous Valley

A cozy science-fantasy farming, invention, village, and JRPG project built in Godot 4 with GDScript.

## Current development state

The machine-verified bootstrap is merged to `main`. Active development is now the **vertical-slice v2** lane: a clearer, data-driven, more readable version of **Nick's First Spark: The Broken Water Pump**.

Core loop:

`observe problem → gather evidence/materials → experiment → build → deploy → see village change`

## Run

1. Open the repository as a Godot 4 project.
2. Run the configured main scene.
3. Move with arrow keys or WASD.
4. Interact with Enter or Space.
5. Save with F5 and load with F9.

## What v2 adds

- data-driven objectives and interaction points from `data/vertical_slice.json`
- named world zones: workshop yard, village green, grandfather's lab, creek/salvage path, and village garden
- interaction prompts for nearby targets
- clearer quest and inventory presentation
- visible village-trust state
- stronger before/after garden feedback
- transmission-tower completion effect
- versioned save format
- expanded headless acceptance tests

## Project authority

- `docs/status.md` — current state and active gate
- `docs/vertical-slice.md` — required player experience and acceptance criteria
- `docs/architecture.md` — canonical technical source of truth
- `docs/content-model.md` — current data/content boundary
- `docs/roadmap.md` — milestone order
- `docs/decision-log.md` — important decisions and rationale
- `docs/verification.md` — what is actually verified
- `docs/playtest-template.md` — human playtest evidence

## Verification

Godot 4.7.2 CI currently verifies project import, main-scene launch, content loading, quest progression, missing-part gating, four-part collection, pump installation, village-trust change, tower completion, and save/load restoration.

Human interactive acceptance is separate and still required. Passing CI does not establish pacing, clarity, feel, emotional impact, fun, or visual quality.
