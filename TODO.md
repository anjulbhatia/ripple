# Ripple TODO — prioritized, actionable

Core flow first: Describe → generate declarative UI → save to gallery →
open later → simple data storage. Everything else secondary.

## P0 — core flow (next)
- [x] Assets landed: `splash.png`/`icon.png` copied to
      `ripple_flutter/assets/images/`, launcher icons generated.
- [x] Main interface shell: drawer (Create, chats, apps, profile+settings),
      top bar (drawer left, avatar right → profile), no bottom nav.
- [x] Home: `Hi {{name}}` greeting, Your Apps 2x5 grid + View All,
      Explore 2x5 grid + View All, create prompt bar → Create screen.
- [x] Screens: Explore (published), Profile+settings (sign out),
      Create (prompt + starter template → saved app), Runner (renders
      saved declarative UI).
- [ ] Start server: user runs `serverpod start` (applies migrations
      `20261014135210853`, `20261014202717080`). Agent must NOT start
      server itself.
- [ ] End-to-end test: sign in → create → open → data persists.
- [x] Gallery screen: list via `GalleryService`, open runner, delete.
- [x] Builder/Create screen: prompt + starter templates (counter, habit
      tracker, notes) → catalog-valid JSON → `createApp`.
- [x] Runner screen: renders saved UI via `UiRenderer`.
- [ ] Runner data: load/persist `AppData` through `AppDataService`
      (wire action writes to server).
- [ ] Sign-in wiring: wrap home in `SignInScreen` so gallery scopes per
      user (endpoints already stamp `ownerUserId` when authenticated).

## P1 — sharing & polish
- [ ] Sharing UI: create/revoke magic link, expiry display, open via link.
- [ ] Explore (published apps list via `listPublished`).
- [ ] Template library expansion (more MVP starter templates).
- [ ] Catalog additions only with `uiSchemaVersion` bump + docs.

## P2 — deferred (do NOT start early)
- [ ] App shortcuts / home-screen widgets (mock or defer per PRD).
- [ ] Google Sheets storage option.
- [ ] Realtime/chat/multiplayer — OUT OF SCOPE, do not build.

## Done
- [x] Passwordless auth: `OtpChallenge` model + `OtpAuthEndpoint`
      (request 4-digit code, 10-min expiry, verify → real Serverpod
      session). Migration `20261014202717080`. Flutter: `OtpScreen`,
      `AuthGate`, `AuthService`, wired as app home behind splash.
- [x] Theme: lime `#D3FB52` primary, olive `#052326` ink/accent,
      neutral scale, Oswald display + Roboto body, Material icons.
- [x] Asset prep: `ripple_flutter/assets/images/` + pubspec entry,
      `flutter_launcher_icons` config, splash with fallback mark.
      Pending only the actual `splash.png`/`icon.png` files from user.
- [x] Confirm `serverpod create ripple` scaffold (server/client/flutter).
- [x] Flutter folders: `ui_engine/`, `features/{gallery,builder,runner,
      sharing}/`, `services/`.
- [x] Models: `AppDefinition`, `AppData`, `MagicLink`
      (`ripple_server/lib/src/apps/*.spy.yaml`).
- [x] Endpoints: `AppEndpoint`, `AppDataEndpoint`, `ShareEndpoint`
      (`ripple_server/lib/src/apps/*.dart`).
- [x] `serverpod generate` clean; `dart analyze` clean (server + flutter).
- [x] Migration `20261014135210853` created (3 new tables, non-destructive).
- [x] `UiRenderer` v1 interpreter + `ComponentCatalog` (13 types).
- [x] Services: `GalleryService`, `AppDataService`, `SharingService`.
