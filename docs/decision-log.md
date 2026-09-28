# Decision Log

## 2026-09-28 — Engine and language
**Decision:** Godot 4.x with GDScript.
**Reason:** Fast 2D iteration, open-source tooling, text-friendly project files, and low infrastructure overhead.
**Deferred alternatives:** Unity, Unreal, custom engine, web-first runtime.

## 2026-09-28 — Vertical-slice scope
**Decision:** Build “Nick's First Spark: The Broken Water Pump” before expanding farming, JRPG, social, or infrastructure systems.
**Reason:** A complete small loop can be playtested and falsified; a broad feature inventory cannot.

## 2026-09-28 — Architecture authority
**Decision:** Keep one canonical `docs/architecture.md`.
**Reason:** Avoid competing technical source-of-truth documents across human and AI collaborators.

## 2026-09-28 — Bootstrap visuals
**Decision:** Start with procedural placeholder shapes and labels.
**Reason:** Validate interaction and state flow before production-art investment.

## 2026-09-28 — AI workflow
**Decision:** spec → small ticket → implementation → engine execution → playtest evidence → review/repair → accepted commit.
**Reason:** Observed behavior outranks model confidence.

## 2026-09-28 — Merge machine-verified foundation before human acceptance
**Decision:** Merge the bootstrap once import, launch, state-machine behavior, and persistence pass CI; track human acceptance separately.
**Reason:** Human acceptance is a milestone-quality gate, not a reason to block a technically stable foundation from becoming the shared base.

## 2026-09-28 — First content extraction
**Decision:** Move objectives and interaction metadata into `data/vertical_slice.json`.
**Reason:** The same content now serves runtime presentation, interaction affordances, and automated verification; the boundary is demonstrated rather than speculative.

## 2026-09-28 — v2 presentation remains procedural
**Decision:** Improve world readability with named zones, interaction prompts, animated state feedback, and stronger UI before introducing production assets.
**Reason:** This tests composition and affordance quality while keeping iteration extremely fast.

## 2026-09-28 — Save schema versioning
**Decision:** Introduce save version 2 while preserving compatibility with version 1 bootstrap saves.
**Reason:** Persistence is already part of the acceptance contract and should evolve deliberately.

## 2026-09-28 — Separate machine evidence from human judgment
**Decision:** CI PASS may establish runtime correctness only; human play remains required for feel, comprehension, pacing, emotional impact, and fun.
**Reason:** These are different claim types and need different evidence.
