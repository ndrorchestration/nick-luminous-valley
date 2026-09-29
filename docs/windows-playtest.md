# Windows Playtest Build

GitHub Actions produces a Windows playtest artifact from the current project.

## Current human-play candidate

Current PR #21 motion/atmosphere/lighting-depth candidate runtime/test head:

`5d911a030463f1d0d750696c9dd1438715469914`

PR #21 merged at:

`8873dd4d18c380ed760387792052c6a987b3350d`

Latest verified Windows packaging run:

`#36511622117 — PASS`

Latest artifact:
- name: `Nicks-Luminous-Valley-Windows-Playtest`
- artifact ID: `11009134048`
- expected executable: `NicksLuminousValley.exe`
- digest: `sha256:fa3780a0b3425b0719486e0245e3f85dee726b18566eb75d93b2aaa1f148e7ec`
- GitHub expiry: 2026-10-13 for this specific artifact

## Durable Drive mirror

The current human-play handoff is mirrored in Google Drive under:

`Active Projects / Nick's Luminous Valley`

Folder:

https://drive.google.com/drive/folders/1A2tHqaNKAutBIDDhtA464nuNm3LemaHG

Latest Windows ZIP:

https://drive.google.com/file/d/1TKb5HOavTVsXOHjQPpkITt_iUvM93Ll6/view?usp=drivesdk

Latest rendered visual-evidence ZIP:

https://drive.google.com/file/d/1nVjMbV6ptMUCZ6NHQcLNuNntdELJC6lI/view?usp=drivesdk

Drive is a durable handoff mirror. GitHub remains the authority for exact source, workflow run, artifact identity, and implementation state.

## Rendered evidence companion

Latest rendered visual-evidence run:

`#36511622061 — PASS`

Artifact ID:

`11009124029`

Digest:

`sha256:d1f70a480d6b78cf10f7316b48002a3dbe8b3e345e2b7c499ca39e942f44e0f8`

Use the rendered evidence for comparison and review, but do not substitute screenshots for interactive play.

## Build contract

Before upload, CI:
1. installs Godot 4.7.2 and export templates
2. imports the project
3. runs the vertical-slice acceptance script
4. exports the Windows Desktop preset
5. verifies the executable exists
6. uploads the build as a GitHub Actions artifact

## Historical packaging evidence

Initial verified packaging run:

`#36496236186 — PASS`

Initial artifact ID:

`11003955591`

Initial digest:

`sha256:20dedfc3f8b60c61e044bb957093fb93e21433363443500e30507e487fb527da`

Prior remediation candidate:
- head: `ce9c193b6b60018bdebc5e89abc0ab00b89e9702`
- Windows artifact: `11006042768`
- visual artifact: `11005544111`

Historical entries remain provenance, not the current preferred human-play package.

## Human acceptance

Running the exported executable is still a human acceptance step.

Packaging success does not establish:
- input feel
- readability
- pacing
- player comprehension
- emotional impact
- fun
- production visual quality
- external-player acceptance

Record those results in issue #7 and `docs/playtest-template.md`.
