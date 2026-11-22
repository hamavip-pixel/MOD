# HAMA⚡VIP — Objective-C++ / Logos UI project

This is a **visual UI-only** Theos tweak project. It creates a red HAMA VIP floating button and a menu with cosmetic switches.

## Build
1. Upload the project contents to a GitHub repository on the `main` branch.
2. Open **Actions**.
3. Select **Build HAMA VIP UI Dylib** and run it, or push a commit.
4. Download the `HAMA-VIP-UI-package` artifact.

## PUBG bundle identifiers
`filter.plist` lists common PUBG package identifiers. This is only an app-target filter; it does not guarantee compatibility with every regional release or future update. Check the installed app's bundle identifier and add it to `filter.plist` if needed.

## Important scope
The ESP RADAR, AIMBOT, MEMORY and other switches are visual placeholders only. This project does not read or write game memory, inspect players, alter gameplay, bypass anti-cheat, or implement cheat functionality. The displayed app version/build are read from the app's own bundle metadata.
