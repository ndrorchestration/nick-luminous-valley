# Contributing

This project is currently a tightly scoped vertical-slice effort.

## Change workflow
1. Start from the current authoritative vertical-slice and architecture documents.
2. Define one small, testable change.
3. Implement on a branch.
4. Run the project in Godot 4.
5. Record observed behavior and defects.
6. Commit only after the change satisfies its acceptance criteria.

## Scope control
Do not introduce full seasons, romance, party combat, procedural generation, open-world structure, multiplayer, or generalized subsystems unless the current milestone explicitly changes.

## AI-assisted changes
AI-generated code, prose, or architecture is a proposal until validated against repository authority and runtime behavior.

## Source of truth
- `docs/vertical-slice.md` — current behavior target
- `docs/architecture.md` — technical boundaries
- `docs/decision-log.md` — decisions and rationale
