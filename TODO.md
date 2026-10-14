# Ripple TODO — prioritized, actionable

Core flow first: Describe → generate declarative UI → save to gallery →
open later → simple data storage. Everything else secondary.

## P0 — core flow (next)
- [ ] Start server: user runs `serverpod start` (applies migration
      `20261014135210853`). Agent must NOT start server itself.
- [ ] Gallery screen: list `AppDefinition` via `GalleryService`, open
      runner, delete, entry point to builder.
- [ ] Builder screen: prompt box + MVP template generator (counter, habit
      tracker, notes) emitting catalog-valid JSON → `createApp`.
- [ ] Runner screen: `UiRenderer` + load/persist `AppData` through
      `AppDataService` (wire action writes to server).
- [ ] End-to-end test: describe → save → reopen → data persists.
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
