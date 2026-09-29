# Visual Direction

## Purpose

Define and evaluate the first coherent production-art direction for **Nick's Luminous Valley**.

The first authored visual candidate set is now mechanically implemented. This document remains the visual acceptance contract; implementation presence does not imply visual acceptance.

## Current implementation state

The current visual manifest has **17/17 populated candidate slots**, including a cohesive full-field world-base layer:

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
- baseline rendered evidence: Visual #36501775914 PASS; artifact #11005607995
- remediation: Godot #36502420186 PASS; Windows #36502420202 PASS; Visual #36502420148 PASS; artifact #11005544111
- field-motion / atmosphere v1: Godot #36510776231 PASS; Windows #36510776222 PASS; Visual #36510776274 PASS; Windows artifact #11009097725; visual artifact #11009152621
- lighting / environmental-depth v2: Godot #36511622050 PASS; Windows #36511622117 PASS; Visual #36511622061 PASS; Windows artifact #11009134048; visual artifact #11009124029
- environment material-detail v3: Godot #36512026477 PASS; Windows #36512026476 PASS; Visual #36512026501 PASS; Windows artifact #11009801104; visual artifact #11009114744

Current state: **RENDERED + MOTION + LIGHTING/DEPTH + ENVIRONMENT DETAIL V3 CANDIDATE IMPROVED / HUMAN VISUAL ACCEPTANCE NOT ESTABLISHED**

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

Current presentation uses authored SVG field/environment/prop candidates plus a full-field authored terrain/path layer routed through the asset manifest. The first rendered review identified spatial fragmentation, small entities, weak grounding, HUD dominance, and a duplicate tower path; the first remediation addressed each of those mechanically and produced materially stronger rendered frames.

Field-motion / atmosphere v1 adds deterministic player-facing motion bias, subtle NPC breathing/bob motion, floating pickups, creek glints, ambient field motes, post-repair garden motes, and a tower signal sweep without changing quest semantics or the visual-manifest schema.

Lighting / environmental-depth v2 adds shallow localized light-temperature cues, creek-bank depth lines, reeds, and boundary foliage. These are presentation-only additions: collision, quest semantics, authored asset slots, and interaction geometry remain unchanged.

Environment material-detail v3 enriches the same authored SVG set with restrained terrain texture, workshop tool/material cues, village-green vegetation accents, lab instrument/archive detail, creek stone/water texture, and stronger damaged-versus-restored garden language. It remains a visual-only refinement of the same five-space slice.

Human review must determine whether this format and motion layer produce the desired pixel-informed/JRPG field look at 960x540.

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

Those require visible-window human review. Deterministic screenshots are now available as supporting implementation evidence but remain non-interactive.

## Current dependency

Issue #7 — Human interactive acceptance — is the primary gate.

Issues #13, #14, and #15 are implemented candidates but remain open until visible-window review confirms their visual acceptance criteria.
