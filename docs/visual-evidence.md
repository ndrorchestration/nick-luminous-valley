# Visual Evidence Capture

This workflow captures deterministic rendered checkpoints from the current Godot scene.

## Workflow

`Visual Evidence Capture`

## Frames

1. `01_opening.png` — initial world state
2. `02_components_and_lab.png` — four repair components collected at the lab
3. `03_restored_garden.png` — pump installed and garden state changed
4. `04_tower_signal.png` — transmission-tower ending state

## Purpose

The artifact provides rendered implementation evidence when a local interactive session is unavailable.

It can support:
- visual regression inspection
- composition review
- art-integration debugging
- comparison of before/after garden state
- verification that authored assets are actually present in a rendered frame

## Evidence boundary

Rendered screenshots are **not human interactive acceptance**.

They do not establish:
- movement feel
- moment-to-moment comprehension
- pacing
- playability
- fun
- final visual quality

Issue #7 remains the human interactive acceptance gate.
