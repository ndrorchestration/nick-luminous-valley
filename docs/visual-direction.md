# Visual Direction

## Purpose

Define and evaluate the first coherent production-art direction for **Nick's Luminous Valley**.

The first authored visual candidate set is now mechanically implemented. This document remains the visual acceptance contract; implementation presence does not imply visual acceptance.

## Current implementation state

The current visual manifest has **16/16 populated candidate slots**:

Characters:
- Nick
- Mira
- Sora

Pickups:
- copper wire
- cracked solar cell
- pipe fitting
- resin

Props/stations:
- lab bench
- garden pump
- transmission tower

Environment:
- workshop yard
- village green
- grandfather's lab
- creek / salvage path
- garden before repair
- garden after repair

UI:
- bordered information panels
- dedicated interaction prompt treatment

Technical evidence:
- character pass: Godot #36500826480 PASS; Windows #36500826416 PASS
- environment pass: Godot #36501057566 PASS; Windows #36501057490 PASS
- complete candidate set: Godot #36501323308 PASS; Windows #36501323360 PASS

Current state: **MACHINE-INTEGRATED CANDIDATE / HUMAN VISUAL ACCEPTANCE NOT ESTABLISHED**

## Visual objective

The game should read immediately as a polished cozy science-fantasy JRPG/farming-adventure hybrid rather than a generic prototype.

The visual identity should combine:
- warm village intimacy
- readable top-down JRPG exploration
- tactile invention/workshop detail
- luminous science-fantasy accents
- visible environmental recovery
- strong character silhouettes
- restrained but memorable mystery cues

## First playable environment

The Broken Water Pump slice should visually distinguish five spaces without requiring labels:
1. workshop yard
2. village green
3. grandfather's lab
4. creek / salvage path
5. village garden

## Character readability

### Nick
Must read immediately as the player character at gameplay scale.

### Mira
Mechanic identity should be legible before dialogue.

### Sora
Ecologist identity should be legible before dialogue.

## Environment language

### Workshop yard
Practical repair space with useful mechanical/solar clutter.

### Grandfather's lab
Older scientific equipment blended with luminous speculative technology and personal history.

### Creek / salvage path
Natural transition zone with clear navigation and plausible salvage context.

### Village garden
Before repair: visibly stressed, muted, interrupted water.
After repair: visibly recovered, brighter, stronger plants, restored water.

### Transmission tower
Distinct, mysterious, memorable enough to serve as the ending hook.

## UI direction

Requirements:
- objective legible at a glance
- nearby interaction prompt has local priority
- repair-part count compact
- village trust reads as consequence
- dialogue/message area separated from movement space
- avoid developer-overlay aesthetics

The current bordered HUD is a candidate implementation of this direction, not accepted final UI.

## Rendering strategy

Current first pass uses authored SVG field/environment/prop candidates routed through the asset manifest. This is a rapid-production candidate format.

Human review must determine whether this format produces the desired pixel-informed/JRPG field look at 960x540.

## Art acceptance criteria

The first coherent visual pass succeeds when:
- a screenshot no longer reads as a debug/procedural prototype
- all five spaces are distinguishable without labels
- Nick is immediately identifiable as controllable
- Mira and Sora are visually distinct
- interactables have discoverable affordances
- garden transformation is obvious within one second
- tower functions as a memorable ending hook
- UI does not obscure navigation
- assets share one coherent shape/material/pixel language
- the result remains readable at 960x540

## Evidence boundary

CI proves loading, runtime compatibility, regression safety, and packaging.

CI does **not** establish:
- visual appeal
- visual hierarchy
- JRPG readability
- cozy identity
- emotional tone
- spatial comprehension
- style cohesion

Those require visible-window human review.

## Current dependency

Issue #7 — Human interactive acceptance — is the primary gate.

Issues #13, #14, and #15 are implemented candidates but remain open until visible-window review confirms their visual acceptance criteria.
