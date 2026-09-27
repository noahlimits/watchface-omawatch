# Connect IQ store listing

**App name:** OmaFork

**Type:** Watch face

**Category:** Watch Faces (secondary: Tools, if a second one is allowed)

**Keywords:** terminal, code, linux, monospace, minimal, developer, tiling, sunrise, heart rate, battery, elevation, dark

**Price:** free

**Languages:** English

**Source code:** https://github.com/noahlimits/watchface-omawatch (MIT fork of https://github.com/jasasonc/omawatch)

**Privacy policy:** https://github.com/noahlimits/garmin-watchface-policies/blob/main/omafork.md

**Support:** committed@gmail.com

---

## Description

OmaFork is a digital watch face based on Jaša Šonc's MIT-licensed OmaWatch. It keeps the original's Omarchy-inspired, dark desktop aesthetic and 22 colour schemes, but focuses on readability and the fēnix 8 AMOLED 47/51 mm.

Two layouts, switchable at any time:

- Neovim: your values as code rows, for example "hr = 54", around a highlighted cursor line that holds the time. A heart rate graph in a box at the bottom.
- Waybar (the default): a bar across the top with the weekday as workspace numbers, the date, Celsius temperature and watch battery. The bottom edge of the bar fills from sunrise to sunset, and a dot marks the time of day.

What this fork changes from the original OmaWatch:

- Adds small seconds next to the main time while the face is awake.
- Adds a four-hour average calculated from the available samples in the heart-rate graph; no samples show as dashes rather than an invented average.
- Adds sunrise and sunset times as choices for the four configurable data slots.
- Enlarges the smaller labels and adjusts contrast for sunset time in themes where it was hard to read.
- Defaults to the two-column Waybar layout, with a compact weekday/month/day date and Celsius-only temperature.
- Targets the fēnix 8 AMOLED 47/51 mm instead of the original's much broader device range. The original offers more data-field and graph choices; this fork keeps a smaller, focused selection.

What you get:

- 22 inherited colour schemes, among them Tokyo Night, Catppuccin, Gruvbox, Everforest and Nord.
- Four rows you set yourself: heart rate, body battery, elevation, steps, temperature, watch battery, floors, stress, sunrise or sunset.
- A sunrise to sunset line that shows how much daylight is left.
- A heart rate graph of the last four hours with an average of the available graph samples.
- Small seconds beside the main time while the face is awake.
- An always-on mode with dim digits that move every minute, to protect the screen.
- Settings on the watch. Hold MENU on the face and open the settings of the face. You do not need the phone.

Before you rate it, please read this:

- The temperature and the sunrise and sunset times come from Garmin's weather data. The watch gets that from your phone, so these fields stay empty until the first sync after you install the face.
- Elevation comes from the barometer of the watch. On watches without one, the row shows two dashes.
- Body battery, stress and floors show data only if your watch records them.

Privacy: the face reads heart rate history, body battery, steps, altitude and available position information to draw the screen. It stores the last valid location locally on the watch to calculate sunrise and sunset. It does not send data to BetterLiving.

OmaFork is not connected to Garmin or the Omarchy desktop project.

## What's new (version 1.1.0)

Waybar is now the default. The header uses a compact, naturally ordered date and Celsius-only temperature; small labels are easier to read, and sunset time has better contrast outside Retro 82.

## Screenshots to upload

1. C:/Users/commi/Documents/Codex/2026-09-22/ss/outputs/fenix8pro-neovim.png
2. C:/Users/commi/Documents/Codex/2026-09-22/ss/outputs/fenix8pro-waybar.png

## Public listing and supported watches

Public submission: https://apps.garmin.com/apps/480c0a70-d600-4b33-b60a-118975879513

The public package targets Garmin's `fenix847mm` device profile, which includes
the fēnix 8 AMOLED 47 mm and 51 mm (including model A04808). Garmin groups
some quatix and tactix AMOLED part numbers under that same profile, so those
names also appear on the Store compatibility tab; this listing does not claim
to have been tested on those watches. The earlier fēnix 8 Pro beta is a
separate app ID and remains independent. Automatic migration to future devices
is disabled.
