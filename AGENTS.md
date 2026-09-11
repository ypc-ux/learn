# Agents — Ascent Placements BD System
# For: Zeerak

Three agents run your entire business development department. You supervise.

## AGENT 1: ProspectFinder

**Purpose:** Finds qualified businesses in target verticals and locations.

### How to use (manual mode — no code needed)

1. Google: `[vertical] [city] site:google.com/maps` or just `[vertical] near [city]`
2. For each result, check qualification:
   - Has a website?
   - 5+ Google reviews?
   - Running ads? (search their name in Meta Ads Library)
   - Owner name visible?
3. Add qualified prospects to `prospects.csv`:

```csv
business_name,owner_name,phone,email,vertical,city,reviews,notes
Rays Roofing,Matt R,470-706-9339,,roofing,Conyers,13,free drone inspection
```

### Future (automated)
Will be wired to Google Places API. For now, manual takes 15 min for 10 prospects.

---

## AGENT 2: ColdEmailer

**Purpose:** Generates personalized cold emails using 5 personas.

### How to use

```bash
cd agentic_priming_pilot

# Generate scripts for a batch of prospects
python -m phase3.cli generate-scripts \
  --context "med spa owner in Buckhead Atlanta" \
  --num-variants 5
```

The system generates 5 variants using the 5 personas (value_prop, urgency,
social_proof, ease, personalized).

### Humanizer pass (required before sending)

Run each generated email through these checks (from A16Z blueprint):

- [ ] 6th-grade reading level
- [ ] Short sentences (staccato rhythm)
- [ ] "You/Your" not "We/Our" dominating
- [ ] One specific detail about THEIR business
- [ ] Under 90 words
- [ ] Sounds like a person texted it, not a marketing dept

If any check fails, rewrite that line by hand. 30 seconds of editing per
email is what separates replies from spam folders.

---

## AGENT 3: OutreachTracker

**Purpose:** Logs every send, response, and outcome. Weekly reports.

### How to use

```bash
# After sending, log it
python -m phase3.cli log-outcome 1 \
  --business "Rays Roofing" \
  --phone "4707069339" \
  --outcome booked \
  --notes "Called back same day, wants demo Thursday"

# Outcomes: booked | no_answer | declined | hung_up | wrong_number | disconnected

# Weekly report
python -m phase3.cli report
python -m phase3.cli report --json   # for the dashboard
```

### The outcomes that matter

| Outcome | Meaning | Next action |
|---|---|---|
| booked | They want the demo | Send calendar link IMMEDIATELY |
| no_answer | Missed/voicemail | Retry day 3 with new angle |
| declined | Not interested | Mark and move on. No begging. |
| hung_up | Bad timing or bad opener | Log which persona, adjust |

---

## THE FULL PIPELINE (putting it together)

```
MONDAY: Find 10 prospects (ProspectFinder)     [15 min]
MONDAY: Generate 10 emails (ColdEmailer)       [10 min]
MONDAY: Personalize top 3, send all 10         [20 min]
TUE-FRI: Log responses (OutreachTracker)       [5 min/day]
FRIDAY: Run report, regenerate weak scripts    [30 min]
```

Total: ~2 hrs/week of actual work. 50 emails. 2+ booked calls. That's the
whole BD department.

---

## SETUP (One-Time)

```bash
# Clone the repos
git clone https://github.com/ypc-ux/ypc-ux ypc-ux
cd ypc-ux/agentic_priming_pilot

# Install Ollama (local LLM, free)
# https://ollama.com/download

# Pull the model
ollama pull mistral

# Generate your first scripts
python -m phase3.cli generate-scripts --context "med spa owner in Atlanta" --num-variants 5
```

If Ollama is not available, ask Julius for API access to a hosted model.
