# Ripple HANDOFF — state + next steps

## What Ripple is
Lovable for personal native apps ("Paintbook": binding provided, user
only paints). Agent outputs declarative UI JSON against a fixed catalog;
Flutter host renders it; Serverpod owns auth/gallery/data/magic links.
Personal apps only — no realtime/chat/multiplayer. See `PROJECT.md`.

## Done this session
- Confirmed scaffold from `serverpod create ripple`: `ripple_server/`,
  `ripple_client/` (generated, untouched), `ripple_flutter/`. Auth
  (email IDP + JWT) already wired in `ripple_server/lib/server.dart`.
- Flutter scaffold (all new, `analyze` clean):
  - `ripple_flutter/lib/ui_engine/`: `ui_schema.dart` (contract, version 1),
    `component_catalog.dart` (13 types), `renderer.dart` (`UiRenderer`
    stateful interpreter, in-memory values), `ui_engine.dart` barrel.
  - `features/{gallery,builder,runner,sharing}/`: placeholder libraries
    with TODOs marking intended wiring.
  - `services/gallery_service.dart`, `services/app_services.dart`
    (`AppDataService`, `SharingService`) over generated client.
- Server (`analyze` clean, `serverpod generate` clean):
  - `ripple_server/lib/src/apps/app_definition.spy.yaml` → table
    `app_definitions` (owner, name, description, uiDefinition JSON String,
    schemaVersion, isPublished, timestamps).
  - `.../app_data.spy.yaml` → table `app_data` (owner, appId, dataKey,
    dataValue JSON-as-String, updatedAt).
  - `.../magic_link.spy.yaml` → table `magic_links` (unique token, appId,
    creator, expiry, revoked).
  - Endpoints: `app_endpoint.dart` (`AppEndpoint`: create/listMy/get/
    update/delete/listPublished), `app_data_endpoint.dart`
    (`AppDataEndpoint`: put/get/getAll/delete), `share_endpoint.dart`
    (`ShareEndpoint`: createMagicLink/openWithMagicLink/revokeMagicLink).
- Migration `migrations/20261014135210853` created via CLI
  (CREATE TABLE x3 + indexes, non-destructive). NOT applied — no running
  server in this session.

## Key decisions
- `appId` stored as plain `int`, NO FK relations: keeps MVP migration
  trivial; referential integrity enforced in endpoint code.
- `ownerUserId: UuidValue?` nullable, auth optional (`requireLogin=false`):
  anonymous/dev use works; signed-in calls auto-stamp/scope via
  `session.authenticated?.authUserId`.
- `uiDefinition`/`dataValue` stored as `String` (JSON opaque to DB).
- Ordering uses `orderByList: (t) => [t.updatedAt.desc()]` (Serverpod 4 has
  no `orderDescending` param). Token uses `const Uuid().v4()` (re-exported
  by `package:serverpod/serverpod.dart`; `UuidValue.v4()` does not exist).
- Generated client requires `validDays` on `createMagicLink` (server
  defaults don't transfer) — service passes 30.

## In progress / blocked
- Nothing in progress. Blocked only on: user must run `serverpod start`
  from project root (applies pending migration, launches Flutter app).

## Exact next steps (for next agent)
1. Ask user to run `serverpod start`, then verify via MCP
   `tail_server_logs` that migration `20261014135210853` applied.
2. Build gallery screen (`features/gallery/gallery_screen.dart`) using
   `GalleryService`; wire home navigation in `main.dart`.
3. Build builder screen: prompt → template JSON → `createApp`.
4. Build runner screen: `UiRenderer` + `AppDataService` persistence.
5. `hot_restart` via serverpod MCP, test core flow end-to-end.
6. Keep `TODO.md` updated; update this file after each milestone.
