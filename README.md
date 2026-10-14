# Ripple — Lovable for Personal Native Apps

Ripple lets anyone create real, persistent, personal apps by simply
describing what they want — no backends, no deployment, no compilation
anxiety. Think of it as a **Paintbook**: the binding (runtime, storage,
auth, sharing, gallery) is already provided. The user only paints.

> Product vision, constraints, and agent rules live in [`PROJECT.md`](PROJECT.md)
> — the single source of truth. Start there.

## How it works

```
User describes app in natural language
        ↓
Agent outputs a declarative UI definition (JSON against a fixed catalog)
        ↓
Definition is stored as a Serverpod model (per-user)
        ↓
Flutter host app renders it with real native widgets
        ↓
Per-app user data is stored in Serverpod (scoped to user + app)
        ↓
Gallery, magic links, and sharing are powered entirely by Serverpod
```

Key constraint: the agent **never generates free-form Flutter code**.
It only emits JSON against the fixed component catalog in
`ripple_flutter/lib/ui_engine/`. This keeps every generated app
compilable and native-feeling by construction.

Personal apps only — no realtime, chat, multiplayer, or social features.

## Repo structure

```
ripple/
├── PROJECT.md                  # Vision, PRD, architecture, agent rules
├── TODO.md                     # Living prioritized task list
├── HANDOFF.md                  # State + next steps for the next agent/human
├── ripple_server/              # Serverpod backend (auth, gallery, data, sharing)
│   └── lib/src/apps/           # AppDefinition, AppData, MagicLink models + endpoints
├── ripple_client/              # Generated client — do not edit
└── ripple_flutter/             # Host app
    └── lib/
        ├── ui_engine/          # Declarative renderer + fixed component catalog
        ├── features/           # gallery, builder, runner, sharing
        └── services/           # Thin wrappers over the generated client
```

## Prerequisites

- Flutter SDK (see `ripple_flutter/pubspec.yaml` for the pinned range)
- Dart SDK (see root `pubspec.yaml`)
- Docker Desktop — required for the local development database
- Serverpod CLI: `dart pub global activate serverpod`

## Run it

From the project root:

```bash
serverpod start
```

This starts the server, applies pending migrations, and launches the
Flutter app. Do **not** start the server yourself from an agent session —
ask the user to run it.

## Development workflow

- Codegen is automatic under `serverpod start`. Manual fallback:
  `serverpod generate` inside `ripple_server/`.
- After changing a model with a `table`, create and apply a migration
  (via the Serverpod MCP tools when the server runs, else
  `serverpod create-migration` in `ripple_server/`).
- Checks after changes: `dart analyze`, `dart format`, relevant tests
  (`dart test` in `ripple_server/`), then review server/Flutter logs.
- Never edit generated code (`ripple_server/lib/src/generated/`,
  `ripple_client/`).

## Core flow (ship this first)

Describe app → generate declarative UI → save to gallery → open later →
simple data storage. Everything else (Explore, shortcuts, widgets,
Sheets sync) is secondary. See `TODO.md` for the prioritized list.

## Hackathon context

Built for the Serverpod "Build Something Real" hackathon: small and
finished beats large and broken. Judging: does it work (30%), Serverpod
stack use (25%), craft (25%), usefulness (20%).
