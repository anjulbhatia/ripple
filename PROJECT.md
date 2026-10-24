# AGENTS.md — Ripple App

> This file is the single source of truth for any coding agent working on Ripple.
> Read it fully before writing or modifying code.

---

## 1. App Idea

**Ripple App** — Lovable for personal native apps. Also described as **The Self-Replicating App**.

In 2025–26, tools like Lovable, Replit, Emergent and others made it possible for non-technical people to create landing websites, web apps, and even apps. But deployment and usability remain major issues. The web apps these tools produce are good for one-time use cases or for dashboarding / internal tools, but they are not good for personal use cases.

You do not want to worry about deployment, analytics, authentication, or authorization. You want something simple and personal.

### Examples of the personal apps people actually want

- A habit tracker for yourself
- A push notification for your grandma when she needs you
- A gamified study discipline tracker for your child
- A simple memory photo vault for yourself

All of these are lacking (to some extent) in current online web tools.

**Ripple solves this.**

Ripple helps you create dynamic interfaces for personal apps. You just click **Start Building**, create a new project by telling the agent what to build, and add any assets you need. You do not need to worry about:

- Database
- Backend
- Logics
- UI
- Compilation time

The app is compiled and ready. Think of it like a **Paintbook**: you do not need to bind the book every time — it already comes with the binding. You just paint.

### How you use the apps you create

- Open your app directly from **Your Apps** gallery
- Or create an **app shortcut** that directly opens your app in your feed
- Create **widgets** that support your app
- Or create an **appless widget** if you want to
- Share privately with others over a **magic link**
- Or **Publish** on the in-app Explore

### Explicit limitations (important)

Ripple is intentionally scoped for **personal apps** only:

- No backend of its own apart from storage (local storage, Google Sheets, or Postgres)
- Meant for personal apps → no realtime chats, no video calls, no building the next Facebook

### Inspiration

- @anjulbuilds
- https://github.com/thesysdev/appless (generative UI approach, constrained component contract, streaming native renderer)

---

## 2. Product Requirements Document (PRD)

### Vision

Make it possible for anyone to create real, persistent, personal native-feeling apps by simply describing what they want — without ever thinking about backends, deployment, databases, authentication, or compilation.

The binding (runtime, storage, auth, sharing, gallery) is already provided by Ripple. The user only paints.

### Target Users

1. Non-technical people who want personal tools (habit trackers, family helpers, private vaults, kids’ trackers, etc.)
2. Indie hackers and makers who are tired of the deployment/auth tax for small personal tools
3. Parents, caregivers, and individuals who need simple, private, always-available micro-apps

### Core Value Proposition

- “I just want a simple private tool that lives on my phone and I can open instantly.”
- No deployment anxiety
- No backend setup
- No “is this still running next month?”
- Feels native and personal

### Success Metrics (for MVP / Hackathon)

- A user can describe a simple personal app in natural language
- The agent produces a working declarative UI definition
- The definition is saved to the user’s personal gallery
- The user can open the app again later from the gallery
- The app can store simple user data (via Serverpod)
- A private magic link can be generated and used to share the app

### Out of Scope (for now)

- Realtime multiplayer / chat / video
- Public social network features beyond a simple Explore
- Arbitrary free-form Flutter code generation
- Complex multi-user collaboration
- Full native home-screen widgets / app shortcuts (can be mocked or deferred)
- Google Sheets integration (use Serverpod Postgres first)

---

## 3. Features (Complete List — Do Not Truncate)

### 3.1 Creation Flow

- Click **Start Building**
- Create a new project just by telling the agent what to build
- Add assets you would need
- No need to worry about database
- No need to worry about backend
- No need to worry about logics
- No need to worry about UI
- No need to worry about compilation time
- The app is already compiled (Paintbook metaphor — the binding is provided, you only paint)

### 3.2 Using Created Apps

- Open your app directly from **Your Apps gallery**
- Create an **app shortcut** that directly opens your app in your feed
- Create **widgets supporting your app**
- Create an **appless widget** if you want to

### 3.3 Sharing & Discovery

- Share privately with others over a **magic link**
- **Publish** on the in-app Explore

### 3.4 Explicit Product Boundaries

- Personal apps only
- No backend of its own apart from storage to local or your Google Sheet / Postgres
- Meant for personal apps → no realtime chats
- No video calls
- Not for making the next Facebook

---

## 4. Technical Direction (for Agents)

### Recommended Architecture (Hackathon-friendly)

```
User describes app in natural language
        ↓
Agent outputs structured declarative UI definition (JSON / constrained DSL)
        ↓
Definition is stored as a Serverpod model (per-user)
        ↓
Flutter host app renders the definition using a fixed, high-quality component catalog
        ↓
Any user data the personal app collects is also stored in Serverpod (scoped to user + app)
        ↓
Gallery, magic links, and sharing are powered entirely by Serverpod
```

### Why this architecture

- **Reliability**: Agent cannot break compilation because it only outputs structured data against a fixed contract.
- **Native feel**: The host app renders real Flutter widgets.
- **Serverpod shines**: Auth, ownership, gallery, magic-link tokens, per-app data storage, generated client.
- **Aligned with 2026 Flutter ecosystem**: Similar spirit to GenUI / A2UI (agent emits UI surfaces from a catalog).

### Avoid

- Letting the agent write arbitrary free-form Flutter code
- Building a full Appless-style streaming generative OS in the remaining time
- Over-scoping into realtime, social, or multi-user features

### Preferred Component Approach

Maintain a fixed catalog of high-quality components (Button, Text, TextField, List, Card, Image, Toggle, BottomSheet, etc.).

The agent outputs a declarative description (Elm-like / JSON tree + simple actions). Example shape:

```json
{
  "type": "Column",
  "children": [
    {
      "type": "Text",
      "text": "Morning Habits",
      "style": { "fontSize": 24, "fontWeight": "bold" }
    },
    {
      "type": "Button",
      "label": "Log Water",
      "style": { "background": "blue" },
      "onClick": { "action": "increment", "key": "water", "value": 1 }
    }
  ]
}
```

A fixed interpreter in the Flutter app turns this into real widgets + simple action handlers.

### Serverpod Responsibilities (where it should shine)

1. Storing App Definitions (the declarative UI + metadata)
2. Authentication and ownership of personal apps
3. Your Apps gallery
4. Magic-link generation and validation
5. Per-app user data storage
6. Clean generated client for the host Flutter app

---

## 5. Hackathon Context (Serverpod Hackathon)

- Event: Build Something Real — The Serverpod Hackathon
- Goal: One real full-stack app with Serverpod as the backend
- Preference: Small and finished > large and broken
- Focus: One user, one problem, one core flow that genuinely works
- Judging weights:
  - Does it work → 30%
  - Use of the Serverpod stack → 25%
  - Craft and technical creativity → 25%
  - Usefulness → 20%

**Priority for remaining time**: Make the core creation → save → open-from-gallery → simple data flow work end-to-end. Everything else is secondary.

---

## 6. Coding Agent Rules

1. Always prefer a finished, working slice over an ambitious incomplete feature.
2. Keep the component catalog and declarative schema as the single source of truth for generated UIs.
3. Put all persistence, auth, gallery, and sharing logic in Serverpod.
4. Do not introduce realtime, chat, or multiplayer features.
5. Do not generate free-form Flutter source code from the agent.
6. When in doubt, ask: “Does this help the one core flow (describe → generate → save → open later)?”
7. Document any new models, endpoints, or component additions clearly.

---

## 7. Current Status & Next Steps

This AGENTS.md captures the full product vision and the constrained technical direction required to ship a credible version under the Serverpod hackathon constraints.

Agents should treat the **Paintbook metaphor** and the **personal-apps-only** boundary as non-negotiable product principles.