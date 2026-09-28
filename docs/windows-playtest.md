# Windows Playtest Build

GitHub Actions produces a Windows playtest artifact from the current project.

## Artifact

Workflow: **Windows Playtest Build**

Artifact name:

`Nicks-Luminous-Valley-Windows-Playtest`

Expected executable:

`NicksLuminousValley.exe`

## Build contract

Before upload, CI:
1. imports the project in Godot 4.7.2
2. runs the vertical-slice acceptance script
3. exports the Windows Desktop preset
4. verifies the executable exists
5. uploads the build as a GitHub Actions artifact

## Local acceptance

Running the exported executable is still a human acceptance step. The artifact proves packaging succeeded; it does not prove input feel, readability, pacing, fun, or visual quality.
