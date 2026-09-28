# Visual Direction

## Purpose

Define the first coherent production-art direction for **Nick's Luminous Valley** after human acceptance of the current functional vertical slice.

This document is an art-direction and acceptance contract. It does not claim the visual direction has been implemented.

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

Each space should have a clear dominant function, silhouette, material language, and value hierarchy.

## Character readability

### Nick

Nick must read as the player character at gameplay scale through silhouette, value contrast, and one or two identity anchors.

Do not rely on fine facial detail for field readability.

### Mira

Mechanic identity should be legible before dialogue through workshop-associated costume/tool language and posture.

### Sora

Ecologist identity should be legible through plant/ecology-associated visual language without becoming a stereotype or costume gag.

## Environment language

### Workshop yard
- salvaged mechanisms
- repair benches
- useful clutter rather than random clutter
- practical solar / mechanical components
- warmer industrial materials

### Grandfather's lab
- older scientific equipment integrated with luminous speculative technology
- evidence of personal history
- clear experiment station
- mystery without horror framing

### Creek / salvage path
- natural transition zone
- recoverable materials embedded plausibly in the environment
- movement path remains visually obvious

### Village garden

Before repair:
- muted / drier
- interrupted water path
- visible stress without looking dead

After repair:
- moving / brighter water
- stronger plant posture and color
- restrained particles / reflections
- unmistakable transformation

### Transmission tower
- visible before the ending
- visually distinct but not fully explained
- completion signal should produce a memorable light/sound cue

## UI direction

The UI should feel hand-built, readable, and lightly technological.

Requirements:
- objective is legible at a glance
- nearby interaction prompt has stronger local priority than passive information
- repair-part count stays compact
- village trust reads as a consequence, not merely a score
- dialogue/message area is separated from movement space
- avoid developer-overlay aesthetics

## Rendering strategy

Preferred first route:
- authored 2D sprites and tiles
- modern pixel-art or pixel-informed rendering
- consistent internal pixel scale
- nearest-neighbor presentation where appropriate
- limited animation set with high pose clarity
- selective lighting and particles above the pixel layer

Do not mix incompatible pixel densities or high-resolution painted field assets without an explicit composition rule.

## Minimum first asset package

- Nick field sprite: idle + 4-direction walk
- Mira field sprite
- Sora field sprite
- interaction marker / prompt treatment
- workshop tiles / props
- lab tiles / props
- creek / path tiles
- garden before / after tiles
- pump before / after
- transmission tower
- four component pickups
- basic UI frame / icon language

Portraits are useful but not required for the first environmental conversion pass.

## Art acceptance criteria

The first coherent visual pass succeeds when:
- a screenshot no longer reads as a debug/procedural prototype
- all five spaces are distinguishable without text labels
- Nick is immediately identifiable as the controllable character
- Mira and Sora are visually distinct
- interactable objects have discoverable affordances
- the garden transformation is obvious within one second
- the tower is memorable enough to function as an ending hook
- UI does not obscure navigation
- assets share one coherent pixel / shape / material language
- the result remains readable at the current 960x540 viewport

## Evidence boundary

Art approval requires visible-window human review.

CI can prove files load and scenes run, but it cannot establish:
- visual appeal
- visual hierarchy
- JRPG readability
- emotional tone
- spatial comprehension
- style cohesion

## Dependency

Do not promote this brief to implemented art state until issue #7 human interactive acceptance is completed or produces a bounded defect list to address first.
