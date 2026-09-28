# Contributing

Nick's Luminous Valley is being developed as a sequence of small, complete, evidence-backed slices.

## Change workflow

1. Read `docs/status.md`, `docs/vertical-slice.md`, and `docs/architecture.md`.
2. Define one bounded change and its acceptance condition.
3. Work on a branch.
4. Keep gameplay content in data when it is already represented by the content model; keep behavior in scripts.
5. Push the branch and let Godot Smoke CI run.
6. Repair CI failures from logs before expanding scope.
7. Perform interactive play when the change affects feel, readability, pacing, presentation, or player comprehension.
8. Update affected documentation in the same PR.

## CI gate

Feature branches are validated on Godot 4.7.2 for:
- project import
- main-scene launch
- vertical-slice state-machine behavior
- persistence contract

CI evidence is necessary but not sufficient for human-facing quality claims.

## Scope control

Do not add full seasons, romance, party combat, procedural generation, open-world structure, multiplayer, deep infrastructure simulation, or generalized frameworks unless the current roadmap explicitly moves into that lane.

## AI-assisted changes

AI-generated code, prose, or architecture is a proposal until validated against repository authority and observed behavior.

## Source of truth

- `docs/status.md` — current state
- `docs/vertical-slice.md` — behavior target
- `docs/architecture.md` — technical boundaries
- `docs/content-model.md` — data/content boundary
- `docs/decision-log.md` — decisions and rationale
- `docs/verification.md` — evidence ledger
