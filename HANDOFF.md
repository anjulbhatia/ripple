# Ripple HANDOFF — state + next steps

## What Ripple is
Lovable for personal native apps ("Paintbook": binding provided, user
only paints). Agent outputs declarative UI JSON against a fixed catalog;
Flutter host renders it; Serverpod owns auth/gallery/data/magic links.
Personal apps only — no realtime/chat/multiplayer. See `PROJECT.md`.

## Done this session (cont. 3 — Genkit + demo polish)
- Genkit in-process in Serverpod server (`genkit` + `genkit_google_genai`
  deps): `GenerateEndpoint.generateUi` (Gemini `gemini-flash-latest`,
  catalog system prompt, server validation + 1 repair retry). No tables,
  no migration. Key via `session.passwords['geminiApiKey']` — user must
  add to `config/passwords.yaml` + restart server.
- Renderer honors style maps (Text fontSize/weight/color, Button
  background); prompt updated to emit them.
- Dev test user: test@ripple.ai / 1234 → Jane (TODO: gate/remove prod).
- Live state: server + web app running under user's `serverpod start`;
  profile/gallery/published calls succeeding; one `generateUi` failure
  seen (no key yet — expected).
- Splash/icon root causes: web icons were Flutter defaults (fixed +
  branded manifest); no native splash existed (added
  flutter_native_splash); new assets need FULL rebuild (hot reload
  skips them). Android/iOS launcher icons were fine all along.
- Mid-write codegen hazard: watch-mode codegen can fail on partially
  written files (stale barrels) — rerun `serverpod generate` to heal.
- `dart test` cannot run while server holds the embedded DB (expected).
- Assets landed: `assets/splash.png` + `assets/icon.png` copied to
  `ripple_flutter/assets/images/`; `dart run flutter_launcher_icons`
  generated Android + iOS icons. Splash screen shows real image.
- Shell (`lib/shell/app_shell.dart`): AppBar (drawer left, avatar right
  → profile), `AppDrawer` (Create New App button, Your chats → create,
  Your apps → gallery, Profile and settings at end), tab switching for
  home/explore/create/gallery/profile. No bottom nav per spec.
- Home (`features/home/`): `Hi {{name}}` (profile userName/fullName/email
  handle via `userProfileInfo.get()`), Your Apps 5-col x 2-row grid +
  View All → gallery, Explore published grid + View All → explore,
  prompt bar → create screen with prompt prefilled.
- Screens: `GalleryScreen` (list, open, delete-confirm),
  `ExploreScreen` (published grid), `ProfileScreen` (identity, settings
  stub, sign out), `CreateScreen` (prompt + `StarterTemplates`
  counter/habit/notes → `createApp`), `RunnerScreen` (renders saved
  `uiDefinition` via `UiRenderer`). Shared `AppTile` + `SectionHeader`.
- `GalleryService` extended: listPublished/getApp/updateApp.
- `main.dart` home now `_Boot` → `AuthGate` → `AppShell`.
- `analyze` clean (lib + test). No server changes this round.
- Step 1 user flow (auth + theme + asset prep), all `analyze` clean,
  `dart test` passes (greeting integration).
- Auth: Serverpod email IDP has NO passwordless magic-link (password
  login + emailed codes for register/reset only, `finishRegistration`
  requires password). Used user's stated fallback: custom 4-digit OTP.
  - `ripple_server/lib/src/auth/`: `otp_challenge.spy.yaml` (table
    `otp_challenges`: email, SHA-256 codeHash, 10-min expiresAt,
    attempts, consumed), `otp_auth_reason.spy.yaml` (enum),
    `otp_auth_exception.spy.yaml` (typed client errors),
    `otp_auth_endpoint.dart` (`OtpAuthEndpoint.requestCode/verifyCode`).
  - Verify mints a REAL session: find-or-create auth user + profile via
    `AuthServices`, then `tokenManager.issueToken(method: 'otp')`.
    Client stores it with `client.auth.updateSignedInUser` — standard
    `isAuthenticated`/`authInfoListenable` work.
  - Code delivery = server log for now (same as Serverpod dev behavior);
    real sender plugs into `_deliverCode` (marked TODO). Max 5 attempts,
    old codes invalidated on re-request, codes never stored plain.
  - Migration `migrations/20261014202717080` created, NOT applied.
- Theme (`ripple_flutter/lib/theme/ripple_theme.dart`): lime `#D3FB52`
  primary, olive `#052326` ink/accent, neutral scale, Oswald display +
  Roboto body via google_fonts, Material icons. Light + dark schemes.
- Flutter auth UI (`features/auth/`): `OtpScreen` (email → code steps,
  typed error messages), `AuthGate` (gates on `authInfoListenable`),
  `SplashScreen` (olive, shows `assets/images/splash.png` or lime-drop
  fallback). `main.dart` home: splash (1.2s) → gate → placeholder.
  `services/auth_service.dart` wraps `client.otpAuth`.
- Assets: `ripple_flutter/assets/images/` + pubspec entry + `.gitkeep`;
  `flutter_launcher_icons` dev dep configured
  (`image_path: assets/images/icon.png`). WAITING on user to drop
  `splash.png`/`icon.png` into root `assets/` (dir does not exist yet).
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
- Passwordless = custom OTP, not Serverpod magic-link (does not exist
  in email IDP). Revisit only if Serverpod adds it; OTP UI already
  matches "email link or code" UX closely enough for hackathon.
- `client.auth` getter comes from `serverpod_auth_idp_flutter` re-export
  of core_flutter — import that package (declared dep) wherever auth
  state is touched, not `ripple_client` alone.
- Generated client methods use positional params (`verifyCode(email,
  code)`); server defaults (e.g. `validDays`) don't transfer.
- Theme tokens live in `RippleColors`/`RippleTheme`; generated apps keep
  inline styles via UiRenderer (host chrome vs app content split).
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
   `tail_server_logs` that migrations `...5210853` + `...2017080` applied.
2. End-to-end test with running server: OTP sign-in (code in server
   log) → create app from prompt → open from grid → check persistence.
3. Runner data step: wire UiRenderer actions to `AppDataService`
   (load values on open, persist writes). Then gen-UI flow (step 3).
2. Build gallery screen (`features/gallery/gallery_screen.dart`) using
   `GalleryService`; wire home navigation in `main.dart`.
3. Build builder screen: prompt → template JSON → `createApp`.
4. Build runner screen: `UiRenderer` + `AppDataService` persistence.
5. `hot_restart` via serverpod MCP, test core flow end-to-end.
6. Keep `TODO.md` updated; update this file after each milestone.
