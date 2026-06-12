---
name: shape-up-pitch
description: Use when writing, improving, or reviewing a Shape Up pitch — turning an idea, rough notes, existing artifacts (epics, tickets, threads, docs), or a half-written draft into a pitch. Also triggers when someone mentions shaping a project, appetite, the betting table, rabbit holes, or no-gos.
---

# Shape Up Pitch Writer

## Overview

Produce a Shape Up pitch with six sections, always in this order: **Problem,
Appetite, Solution, Rabbit Holes, No-Gos, Open Questions.**

Core principle: **the pitch is the writer's bet. You structure, sharpen, and
challenge it — you never invent facts and never make the writer's decisions.**

Cycle context: 6-week cycles with a 2-week cooldown. Appetite is either
**small batch (1–2 weeks)** or **big batch (6 weeks)**.

## Iron rules

1. **Never invent facts.** No fabricated metrics, quotes, ticket counts, team
   sizes, customer anecdotes, or contractual details. Every claim in the
   pitch traces to material the writer provided or to something you verified.
   A plausible detail you made up is still a lie at the betting table.
   - Don't "strengthen" weak evidence. "Maybe 1 in 10 tickets, not sure"
     stays uncertain; it does not become "one of our most common complaints."
   - Missing fact you need? Ask the writer, or record it in Open Questions.
2. **Decisions the writer left open stay open.** "We never decided X" goes in
   Open Questions verbatim. Do not pick an answer and label it "decided
   during shaping" — even when one option is obviously better. Recommend,
   don't decide: "Recommend excluding transactional emails — confirm?"
3. **Appetite is the writer's business decision.** If they haven't stated it,
   ask: "Is this worth a small batch (1–2 weeks) or a big batch (6 weeks)?"
   Never derive appetite from an engineering estimate; if the material
   contains an estimate, surface the conversion explicitly and get the
   writer's confirmation.
4. **All six sections, every pitch.** A section with nothing in it gets an
   explicit "None identified yet" plus a matching entry in Open Questions —
   it is never silently omitted.
5. **Unresolved Open Questions ⇒ status is `shaping`, never `ready to bet`.**

## Process

### 1. Intake
Identify what the writer has: rough notes, a bare idea, artifacts to mine, or
an existing draft. Then ask ONE question — which mode they want:

| Mode | Behavior |
|---|---|
| **scribe** | Structure their material faithfully; flag gaps; don't argue with content |
| **sparring partner** (default) | Also challenge weak sections and quality-bar violations |
| **shaping coach** | Work problem boundaries and a fat-marker-level solution with them before drafting |

If appetite isn't in the material, confirm it in the same exchange (rule 3).

### 2. Gather
Read everything provided (files, links, pasted text). For a bare idea,
interview one question at a time, in Shape Up order: problem evidence first,
appetite next, solution direction after — never solution first. Stop
interviewing when you can draft every section or know exactly which gaps go
to Open Questions.

### 3. Draft
Read `pitch-template.md` in this skill's directory and fill it top to bottom.
The per-section quality bar lives in the template as italic prompts — satisfy
each prompt, then delete it. See `example-pitch.md` for the bar.

In sparring/coach mode, push back during drafting (estimate dressed as
appetite, spec-level solution, unfalsifiable problem). In scribe mode, note
the issue in Open Questions instead of arguing.

### 4. Readiness check
- **scribe:** run the template's readiness checklist yourself; list failures.
- **sparring / coach:** dispatch a FRESH subagent that took no part in
  drafting. Give it: the finished pitch, the readiness checklist from the
  template, and this instruction: "Grade each section PASS/FAIL with quoted
  evidence. Borderline counts as FAIL. Verdict: `ready to bet` or `not
  ready, because …`. You took no part in writing this; judge only what is on
  the page." Report the verdict to the writer unedited, then fix FAILs and
  re-dispatch a new reviewer until pass — or report what still fails and why.

### 5. Deliver
Save to `pitches/YYYY-MM-DD-<slug>.md` in the current project (create the
directory if needed). Set status: `shaping` or `ready to bet` per the
verdict. If the writer wants a Google Doc, give them paste-clean markdown;
offer an upload only if Drive write tooling is already available — never
treat it as required.

## Working without a writer present

If no human can answer (headless run, batch test): default to scribe mode,
make zero assumptions silently — every gap and every recommendation becomes
an Open Questions entry — and set status `shaping`.

## Common mistakes

| Mistake | Correction |
|---|---|
| Inventing evidence to make Problem compelling | Use only provided facts; gaps → Open Questions |
| Closing a decision the writer flagged as open | Keep it open; recommend, don't decide |
| Appetite copied from an engineering estimate | Ask the writer for the budget; flag the conversion |
| Omitting Open Questions because "nothing came up" | Something always came up; re-check gaps and assumptions |
| Solution written as a spec (widgets, components, field names) | Raise altitude: elements + connections, fat-marker level |
| Calling it ready while questions are open | Unresolved items ⇒ `shaping` |
