# Windows Playtest Build

GitHub Actions produces a Windows playtest artifact from the current project.

## Packaging status

Pipeline merged to `main` at:

`468d3215aa12b6a950ad83ed91651dffc63081a2`

Verified packaging run:

`#36496236186 — PASS`

## Artifact

Name:

`Nicks-Luminous-Valley-Windows-Playtest`

Artifact ID:

`11003955591`

Expected executable:

`NicksLuminousValley.exe`

Recorded size:

`38,936,427 bytes`

Recorded digest:

`sha256:20dedfc3f8b60c61e044bb957093fb93e21433363443500e30507e487fb527da`

The verified artifact was created on 2026-09-28 and GitHub reported an expiry of 2026-10-12 for that specific Actions artifact. Future workflow runs create fresh artifacts.

## Build contract

Before upload, CI:
1. installs Godot 4.7.2 and export templates
2. imports the project
3. runs the vertical-slice acceptance script
4. exports the Windows Desktop preset
5. verifies the executable exists
6. uploads the build as a GitHub Actions artifact

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

Record those results in issue #7 and `docs/playtest-template.md`.
