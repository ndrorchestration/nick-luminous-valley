# Nick's Luminous Valley

A cozy science-fantasy farming, invention, village, and JRPG project built in Godot 4 with GDScript.

## Current milestone
**Nick's First Spark: The Broken Water Pump** — a deliberately small playable vertical slice proving the core loop:

observe problem → gather evidence/materials → experiment → build → deploy → see village change

## Run
1. Open this repository as a Godot 4 project.
2. Run the project.
3. Move with arrow keys or WASD.
4. Interact with Enter or Space.
5. Save with F5 and load with F9.

The bootstrap build uses placeholder geometry and labels so interaction, quest state, persistence, and world-state change can be tested before production art is added.

## Project authority
- docs/vertical-slice.md — required player experience and acceptance criteria.
- docs/architecture.md — canonical technical source of truth.
- docs/decision-log.md — important choices, reasons, and deferred alternatives.
- docs/playtest-template.md — evidence-oriented external testing.

## Development rule
AI-generated code is not accepted because it looks plausible. A change is accepted when it runs in Godot and satisfies the relevant acceptance criteria.


## Verification status

Automated runtime verification is established on Godot 4.7.2 via GitHub Actions:
- project import
- main-scene launch
- quest progression
- missing-part gate
- component collection
- pump/world-state transition
- tower completion state
- save/load restoration

Human interactive acceptance is still pending and is tracked separately from automated correctness.
