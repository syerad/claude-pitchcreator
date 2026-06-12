# shape-up-pitch

A Claude Code skill that turns an idea, rough notes, existing artifacts, or
a half-written draft into a Shape Up pitch with six sections: Problem,
Appetite, Solution, Rabbit Holes, No-Gos, Open Questions.

What it enforces:

- Facts come from you. The skill never invents evidence; gaps become Open
  Questions or questions back to you.
- Decisions you left open stay open. It recommends; you decide.
- Appetite is your time budget (small batch 1–2 weeks, big batch 6 weeks),
  never an engineering estimate in disguise.
- A pitch with unresolved Open Questions is `shaping`, not `ready to bet`.

You choose the rigor at intake: **scribe** (structures faithfully),
**sparring partner** (challenges weak sections — default), or **shaping
coach** (works boundaries and solution shape with you first). In sparring
and coach mode, a fresh reviewer that took no part in drafting grades the
pitch against a readiness checklist before you get it.

## Install

```bash
git clone <this-repo>
ln -s "$(pwd)/pitchcreator/skills/shape-up-pitch" ~/.claude/skills/shape-up-pitch
```

## Use

In Claude Code, ask for a pitch in your own words — "write a Shape Up pitch
for X", "shape this epic into a pitch", "sharpen this draft" — and answer
the intake question (mode, and appetite if you haven't stated it). Finished
pitches land in `pitches/YYYY-MM-DD-<slug>.md` in your current project.

## Files

- `skills/shape-up-pitch/SKILL.md` — the process and its rules
- `skills/shape-up-pitch/pitch-template.md` — section skeleton, per-section
  quality bar, readiness checklist
- `skills/shape-up-pitch/example-pitch.md` — what the bar looks like met
