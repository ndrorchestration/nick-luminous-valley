# Verification Ledger

## Foundation evidence

Environment: Godot 4.7.2 on GitHub Actions  
Run: **#36493110377**  
Result: **PASS**

Established for the bootstrap:
- project import
- main-scene launch
- quest progression
- incomplete-repair gate
- four-part collection
- pump/world-state transition
- tower completion
- save/load restoration

Foundation merged to `main` at `0bd1ff387415f4e599e8166615c12d82d69cf218`.

## Vertical-slice v2 evidence

Implementation run: **#36494569694 — PASS**  
Final branch-head run: **#36494912875 — PASS**

Established:
- JSON content loading
- nine interaction points
- Mira/Sora transitions
- missing-part lab rejection
- four-part completion
- pump/world-state transition
- village-trust increase
- tower completion
- save/load restoration

Merged to `main` at `e2529d610e029df4c4f8e061bb7029bb4b83a6d5`.

## Windows packaging evidence

Run: **#36496236186 — PASS**

Established:
- project import before packaging
- vertical-slice acceptance before packaging
- Windows Desktop export succeeds
- `NicksLuminousValley.exe` exists after export
- artifact upload succeeds

Packaging pipeline merged at `468d3215aa12b6a950ad83ed91651dffc63081a2`.

## Art-ready runtime refactor evidence

Godot Smoke: **#36499794753 — PASS**  
Windows Playtest Build: **#36499794719 — PASS**

Established:
- HUD extraction
- world-renderer extraction
- save-store extraction
- quest semantics preserved
- Windows packaging preserved

Merged at `87cc62a72c56493e72b1fe7a486b465851011887`.

## Asset-ingestion contract evidence

Godot Smoke: **#36500157438 — PASS**  
Windows Playtest Build: **#36500157460 — PASS**

Established:
- visual manifest schema v1
- safe missing-slot fallback behavior
- incremental art replacement mechanism
- gameplay and export remain green

Merged at `4b6bcaa6a1628b4578926e550aa8078a42bbc9e1`.

## Authored character candidate evidence

Godot Smoke: **#36500826480 — PASS**  
Windows Playtest Build: **#36500826416 — PASS**

Established:
- Nick field asset imports/loads
- Mira field asset imports/loads
- Sora field asset imports/loads
- gameplay and Windows packaging remain green

Merged at `2c7d431825a820503b0d1c8e9360b5f8abe4ac2d`.

State: **MACHINE-INTEGRATED CANDIDATE / HUMAN VISUAL ACCEPTANCE NOT ESTABLISHED**

## Authored environment candidate evidence

Godot Smoke: **#36501057566 — PASS**  
Windows Playtest Build: **#36501057490 — PASS**

Established:
- workshop yard candidate imports/loads
- village green candidate imports/loads
- grandfather's lab candidate imports/loads
- creek/salvage candidate imports/loads
- garden-before candidate imports/loads
- garden-after candidate imports/loads
- gameplay and Windows packaging remain green

Merged at `f50ccba414aa7bcd9ab02fadb6187f630751adb7`.

State: **MACHINE-INTEGRATED CANDIDATE / HUMAN VISUAL ACCEPTANCE NOT ESTABLISHED**

## Complete first authored visual candidate evidence

Godot Smoke: **#36501323308 — PASS**  
Windows Playtest Build: **#36501323360 — PASS**

Merged to `main` at:

`8deace2bc28019c64de5ba4f4af1fa7ee07d2a9d`

Established:
- all **16/16** current visual manifest slots import and load
- authored character slots resolve
- authored environment slots resolve
- four authored pickups resolve
- lab bench, pump, and tower resolve
- HUD exposes the new bordered hierarchy
- dedicated interaction prompt panel instantiates
- gameplay state machine remains green
- save/load remains green
- Windows export and artifact upload remain green

State: **FIRST AUTHORED VISUAL CANDIDATE SET MACHINE-INTEGRATED**

This state does not establish:
- visual quality
- JRPG/cozy identity
- visual hierarchy
- field readability
- style cohesion
- human/player acceptance

## Rendered visual evidence infrastructure

Godot Smoke: **#36501775952 — PASS**  
Windows Playtest Build: **#36501775882 — PASS**  
Visual Evidence Capture: **#36501775914 — PASS**

Artifact:
- ID: `11005607995`
- digest: `sha256:d0b0d1cd869b53d9743c53d5c970740c422f52bb276c2124c3dd68548a278844`
- four deterministic 960×540 PNG checkpoints

Merged at `0de3f835c7c07ec0ff991e918b3a60dfc92635af`.

Established:
- the live Godot scene can be rendered under a virtual display
- opening, lab/components, restored-garden, and tower-ending frames can be captured deterministically
- screenshots can be retained as inspectable artifacts

This provides rendered implementation evidence, not interactive human acceptance.

## First evidence-driven visual remediation

Godot Smoke: **#36502420186 — PASS**  
Windows Playtest Build: **#36502420202 — PASS**  
Visual Evidence Capture: **#36502420148 — PASS**

Artifact:
- ID: `11005544111`
- digest: `sha256:9188cad96b3c567907c3d020596ccba505e1da0da001dcc392a91b01f3773eff`

Merged at `e1148324764d056556c67b04e2dcf134254d52ca`.

Rendered comparison supports:
- materially stronger spatial cohesion
- larger/more readable field entities
- improved entity grounding
- reduced HUD dominance
- removal of duplicate tower rendering
- clearer tower signal treatment
- preserved garden before/after contrast

State: **RENDERED VISUAL CANDIDATE IMPROVED / HUMAN VISUAL ACCEPTANCE NOT ESTABLISHED**

## Field motion and atmospheric candidate

Godot Smoke: **#36510776231 — PASS**  
Windows Playtest Build: **#36510776222 — PASS**  
Visual Evidence Capture: **#36510776274 — PASS**

Exact branch head:

`019bd2e29fbe8e2ad95798e47efcae3df1c289f2`

Artifacts:
- Windows playtest ID: `11009097725`
- Windows digest: `sha256:3822a3df5323e1ed5b4db8aff909abff02ef611a096a15f8a8d28446df356891`
- rendered visual evidence ID: `11009152621`
- visual-evidence digest: `sha256:b450cff4af68823cc5cb806f3509267e5c0d58d813ba8238fa62f2b5d9530f69`

Established:
- deterministic motion profile v1 loads
- player field motion varies over time with facing-direction bias
- NPC candidate motion varies subtly over time
- pickup motion varies over time
- ambient field motes render
- creek glints render
- repaired-garden motes render when world state changes
- tower signal sweep renders at the completion state
- quest semantics remain green
- save/load remains green
- Windows packaging remains green
- rendered-evidence capture remains green

State: **MACHINE-VERIFIED MOTION/ATMOSPHERE CANDIDATE / HUMAN VISUAL ACCEPTANCE NOT ESTABLISHED**

## Lighting and environmental-depth v2

Godot Smoke: **#36511622050 — PASS**  
Windows Playtest Build: **#36511622117 — PASS**  
Visual Evidence Capture: **#36511622061 — PASS**

Exact runtime/test head:

`5d911a030463f1d0d750696c9dd1438715469914`

Artifacts:
- Windows playtest ID: `11009134048`
- Windows digest: `sha256:fa3780a0b3425b0719486e0245e3f85dee726b18566eb75d93b2aaa1f148e7ec`
- rendered visual evidence ID: `11009124029`
- visual-evidence digest: `sha256:d1f70a480d6b78cf10f7316b48002a3dbe8b3e345e2b7c499ca39e942f44e0f8`

Established:
- presentation profile v2 loads under smoke acceptance
- localized light-temperature cues render
- creek bank/reed depth cues render
- boundary foliage renders
- quest semantics remain green
- save/load remains green
- Windows packaging remains green
- rendered-evidence capture remains green

State: **MACHINE-VERIFIED LIGHTING/DEPTH CANDIDATE / HUMAN VISUAL ACCEPTANCE NOT ESTABLISHED**

## Environment material-detail v3

Godot Smoke: **#36512026477 — PASS**  
Windows Playtest Build: **#36512026476 — PASS**  
Visual Evidence Capture: **#36512026501 — PASS**

Exact implementation head:

`0849cc0cd932b7bd0461d24d95118589a11a48a3`

Artifacts:
- Windows playtest ID: `11009801104`
- Windows digest: `sha256:bb120e0d480f70f99b1b236a1be1a7f333c0e5c0b80e1861705f049e09ef82c2`
- rendered visual evidence ID: `11009114744`
- visual-evidence digest: `sha256:4093705f9017f19015b7e772088600d5dd7cf3f8401a41e575d8b03ec41be1ee`

Established:
- all authored environment textures continue to import/load
- workshop, village-green, lab, creek, and garden detail additions render
- before/after garden contrast remains intact
- movement and quest semantics remain green
- save/load remains green
- Windows packaging remains green
- rendered-evidence capture remains green

Rendered comparison supports increased material/detail density without an observed navigation regression in the deterministic capture. This is implementation evidence, not human visual acceptance.

State: **MACHINE-VERIFIED ENVIRONMENT-DETAIL CANDIDATE / HUMAN VISUAL ACCEPTANCE NOT ESTABLISHED**

## JRPG/cartoon convergence v1

Godot Smoke: **#36513633818 — PASS**  
Windows Playtest Build: **#36513633735 — PASS**  
Visual Evidence Capture: **#36513633729 — PASS**

Exact candidate head:

`4a48c6ae8c060d816863aed1f5079a914d14c93c`

Merged at:

`18af1c7aca1e0fb9eb2111207725367347140749`

Artifacts:
- Windows playtest ID: `11009512738`
- Windows digest: `sha256:4fb00dd5a0f8830f3a6636db7d0898a40ba7ed52be41c8b40fd84cc58411a093`
- rendered visual evidence ID: `11009612578`
- visual-evidence digest: `sha256:5f0d22ed629088536a96795696ca973de2d54dca989ca3cfb4df1eaf1c56407c`

Established:
- Nick, Mira, and Sora use the JRPG/cartoon convergence candidate assets
- field/background SVGs contain the convergence marker required by smoke acceptance
- chunkier field-map language and stronger identity accents render in deterministic checkpoints
- quest semantics, save/load, Windows packaging, and evidence capture remain green

State: **MACHINE-VERIFIED JRPG/CARTOON CANDIDATE / HUMAN VISUAL ACCEPTANCE NOT ESTABLISHED**

## JRPG HUD convergence v1

Godot Smoke: **#36517277505 — PASS**  
Windows Playtest Build: **#36517277506 — PASS**  
Visual Evidence Capture: **#36517277356 — PASS**

Exact implementation/test head:

`95dddae183413fef785effd00be74562f65a873f`

Artifacts:
- Windows playtest ID: `11010864941`
- Windows digest: `sha256:af0c908b87c1895aa51c063dba69722d3cfd4ef343e10d3284888ee22a5da429`
- rendered visual evidence ID: `11011272474`
- visual-evidence digest: `sha256:fb5269b71c8fa03bd7cf1798772152392487cfc0b7fa9b49dc1ba22f2d636654`

Established:
- HUD profile version 2 loads under smoke acceptance
- objective tag, stat chips, field-controls label, field-log label, and local prompt treatment instantiate
- hidden interaction prompts do not leave a stray accent artifact
- long objective text no longer collides with the PARTS/TRUST row in deterministic capture
- quest semantics, save/load, Windows packaging, and rendered capture remain green

Rendered comparison supports a more authored JRPG information hierarchy with less developer-overlay character. This is implementation evidence, not human UI acceptance.

State: **MACHINE-VERIFIED JRPG HUD CANDIDATE / HUMAN VISUAL ACCEPTANCE NOT ESTABLISHED**

## Not established

Automated CI does **not** establish:
- input feel
- visual readability in a real game window
- pacing
- player comprehension without coaching
- emotional impact
- fun
- accepted production-art quality
- external-player acceptance

These require interactive human play. See issue #7 and `docs/playtest-template.md`.
