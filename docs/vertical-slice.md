# Vertical Slice — Nick's First Spark: The Broken Water Pump

## Purpose

Prove the smallest complete game promise:

`observe a village problem → gather evidence/materials → experiment → build → deploy → observe persistent community change`

## Player sequence

1. Orient within a readable small world.
2. Meet Mira in the workshop yard.
3. Find Sora near the village green/garden.
4. Recover copper wire, a cracked solar cell, a pipe fitting, and resin along the creek/salvage path.
5. Return to the grandfather's lab.
6. Confirm the lab refuses an incomplete repair.
7. Complete the stabilized solar-assisted pump.
8. Install it in the village garden.
9. See water and plant-state feedback change.
10. See village trust increase.
11. Investigate the transmission tower.
12. Receive the first coded signal from Nick's grandfather.

## Automated acceptance criteria

- Godot imports the project without error.
- The configured main scene launches.
- `data/vertical_slice.json` loads nine interaction points.
- The player-state machine begins at stage 0.
- Mira advances stage 0 → 1.
- Sora advances stage 1 → 2.
- Three collected components remain insufficient.
- The lab blocks progression with a missing part.
- The fourth component completes the requirement.
- The lab advances stage 2 → 3.
- Pump installation advances stage 3 → 4.
- Pump installation changes world state.
- Pump installation increases village trust.
- Tower interaction advances stage 4 → 5.
- Save/load restores stage, inventory, world state, village trust, and player position.

## Human acceptance criteria

- Movement feels controllable.
- The next intended action is understandable without coaching.
- Interaction prompts are readable and appear at useful distances.
- The named world zones are visually distinguishable.
- The garden's before/after state is obvious.
- The tower payoff reads as a narrative hook rather than another generic interaction.
- The player can complete the slice without needing repository documentation.

## Explicitly deferred

Full seasons, romance, party combat, procedural generation, open world, deep electricity simulation, full NPC schedules, large crafting trees, online features, voice acting, multiplayer, and production asset pipelines.
