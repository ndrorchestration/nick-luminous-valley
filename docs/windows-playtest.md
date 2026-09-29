# Windows Playtest Build

GitHub Actions produces a Windows playtest artifact from the current project.

## Current human-play candidate

Current remediation head:

`ce9c193b6b60018bdebc5e89abc0ab00b89e9702`

Latest verified Windows packaging run:

`#36502420202 — PASS`

Latest artifact:
- name: `Nicks-Luminous-Valley-Windows-Playtest`
- artifact ID: `11006042768`
- expected executable: `NicksLuminousValley.exe`
- size: `38,953,117 bytes`
- digest: `sha256:93657a502f18c00dd205af5259ae5438eb5fb29618b0eb81c2889ecd96225656`
- GitHub expiry: 2026-10-13 for this specific artifact

## Durable Drive mirror

The current human-play handoff is mirrored in Google Drive under:

`Active Projects / Nick's Luminous Valley`

Folder:

https://drive.google.com/drive/folders/1A2tHqaNKAutBIDDhtA464nuNm3LemaHG

Latest Windows ZIP:

https://drive.google.com/file/d/1dpmOsAWovXFINaFf74_6GQouKQfCGXMN/view?usp=drivesdk

Latest rendered visual-evidence ZIP:

https://drive.google.com/file/d/1mG1Ymf4g0zGHH2aDIzWlhfTcClHZCdT9/view?usp=drivesdk

Drive is a durable handoff mirror. GitHub remains the authority for exact source, workflow run, artifact identity, and implementation state.

## Rendered evidence companion

Latest rendered visual-evidence run:

`#36502420148 — PASS`

Artifact ID:

`11005544111`

Digest:

`sha256:9188cad96b3c567907c3d020596ccba505e1da0da001dcc392a91b01f3773eff`

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

This remains provenance, not the current preferred human-play package.

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
