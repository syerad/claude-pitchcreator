# Pitch: Notification Digest Mode

| | |
|---|---|
| **Author** | Jordan Velez |
| **Date** | 2026-05-28 |
| **Appetite** | Big batch (6 weeks) |
| **Status** | shaping |

## Problem

Our app sends a separate email for every notification event. Customers are
pushing back through two signals:

- Support estimates email-volume complaints appear in roughly 1 in 10
  tickets (their gut number, not measured — see Open Questions).
- At least three named accounts have set up inbox filters that send
  everything from our domain to trash (reported by their CSMs). Once a
  customer filters us wholesale, they miss the notifications that matter
  and every future email is invisible.

Today the only choices are "receive everything" or "filter us out." That
binary is costing us the channel: a filtered-out customer is worse for
engagement than one receiving a single daily digest.

## Appetite

Big batch: one 6-week cycle. This is a budget, not an estimate — engineering
guessed digest delivery alone at 3–4 weeks, and we are deliberately giving
the full problem one cycle, no more. If it outgrows the cycle, we cut scope
(per-category controls go first), we don't extend.

## Solution

Two elements, fat-marker level:

1. **Per-category email controls.** Group all notification emails into 4–6
   categories. Each category gets one setting: real-time / digest / off.
   Defaults preserve current behavior, so untouched accounts see no change.

2. **One digest email.** Categories set to "digest" accumulate events; a
   scheduled send rolls them into a single email per user (daily or weekly,
   one global choice). Empty digest = no email. Line-item format: category,
   one-line description, timestamp, link — nothing richer.

Connection: the existing email dispatch path checks the category setting at
send time; "digest" routes the event to a per-user queue instead of sending.

## Rabbit Holes

- **Category taxonomy explosion.** A toggle per event type is the trap.
  Boundary: pick 4–6 categories in week one, map every existing email into
  exactly one, stop. Events that fit badly go in the closest bucket.
- **Digest template ambitions.** Rendering every event type beautifully is a
  design project of its own. Boundary: one generic line-item format; events
  that can't render in it render as plain text.
- **Per-user send-time scheduling.** "9am in the user's timezone" assumes
  timezone data we may not have. Fallback decided now: one fixed batch
  window per day; revisit only if customers complain.

## No-Gos

- Mobile push notifications — separate project, untouched here.
- In-app notification center — considered, rejected for this cycle; doesn't
  stop the email bleeding while we build it.
- Org-level admin policies forcing members' settings — per-user only.
- Changes to marketing/lifecycle emails — different system, different rules.
- Exactly-once delivery guarantees for digests — occasional duplicate or
  late digest is acceptable.

## Open Questions

1. **Transactional emails (password reset, billing receipts): in or out of
   the category system?** We never decided. Recommendation: always send,
   never configurable — needs the writer's and legal's confirmation.
2. **Support's "1 in 10 tickets" number is unverified.** Do we bet on the
   inbox-filter evidence alone, or spend a day measuring complaint rate
   first?
3. **Marketing uses some product notifications as engagement touchpoints.**
   Which categories do they consider load-bearing? Needs a 30-minute
   alignment before the betting table.
