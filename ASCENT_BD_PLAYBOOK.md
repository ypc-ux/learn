# Ascent Placements — Business Development Playbook
# Owner: Zeerak (Community Manager & Marketing Lead)
# Version: 1.0

## YOUR ROLE

You run business development for Ascent Placements on your own. The systems below let you find prospects, generate personalized outreach, and track results — without waiting on anyone.

Your tools: VS Code + the agentic_priming_pilot repo + this playbook.

## DAILY WORKFLOW (30-60 minutes)

### Morning Block (20 min)
1. Open VS Code
2. Run the prospect finder (see AGENTS.md)
3. Generate 10 cold emails for the top 10 prospects
4. Review and personalize the top 3 (add one specific detail each)

### Send Block (15 min)
5. Send the 3 personalized emails manually (highest quality)
6. Send the other 7 as templates (fast)

### Track Block (10 min)
7. Log every send in the tracker
8. Log any responses from yesterday
9. Check the ops digest for flagged accounts

### Weekly (Friday, 30 min)
10. Run the report: response rate, booking rate, best persona
11. Feed results back into script regeneration
12. Update the team dashboard

## THE 5 COLD EMAIL PERSONAS

The system generates emails using these angles. Rotate them.

### 1. Value Prop (default)
Lead with a concrete time or money benefit before asking for anything.

> "We booked 20 appointments for a roofing company in Conyers last month. They only paid for the appointments that showed up."

### 2. Urgency
Limited availability. Real constraints only — never fake deadlines.

> "We have 2 onboarding slots left this month. Next opening is 3 weeks out."

### 3. Social Proof
Similar businesses nearby are using the service.

> "Shops like yours in Gwinnett County are already using this — one closed 4 jobs from it last week."

### 4. Ease
Small, reversible, low-effort ask.

> "Takes 15 minutes to see if it works for you. If not, you lose nothing."

### 5. Personalized
Reference a specific detail about THEIR business from your research.

> "I saw your reviews mention free drone inspections — that's exactly the hook our AI leads with."

## THE COLD EMAIL FORMULA

Every email follows the A16Z hook architecture:

```
Line 1 (Context Lean-In): Topic clear in 5 words. Their name or business.
Line 2 (Scroll-Stop): "But" / "However" / "Here's the thing."
Line 3 (Contrarian Snapback): Reverse their expectation.
Line 4-5 (Value Transfer): Concrete benefit + proof.
Line 6 (Ease Close): Small ask. 15-minute call.
```

### Assembled Example

> Subject: Your competitor booked the lead you missed
>
> Hey Matt — quick one about Mr. Roofing.
>
> Most contractors call leads back in 42 minutes. The average homeowner has already hired someone else by minute 10.
>
> But here's the thing: we built a system that calls your leads in 5 minutes, pre-qualifies them, and books them on your calendar. You just show up and sell.
>
> One roofing company in Conyers got 20 booked appointments in 30 days. Paid $200 per appointment that actually showed up.
>
> Worth 15 minutes to see if it works for you?
>
> — Julius

### The Rules

- Subject line: under 6 words. Curiosity or pain.
- Never more than 90 words total
- One ask only (15-minute call)
- No links in the first email (deliverability)
- Day 3 follow-up: ONE new piece of info, not "bumping this"
- Day 7 follow-up: a case study or result
- Stop after 3 touches

## PROSPECT TARGETING

### Verticals (conversion order)
1. Med spas / aesthetic clinics (Ascent core)
2. Roofing contractors
3. Windows & siding
4. HVAC
5. Commercial cleaning

### Qualification (need 3 of 4)
- Has a website?
- 5+ Google reviews?
- Actively advertising?
- Owner's name findable?

## WEEKLY METRICS

| Metric | Target |
|---|---|
| Emails sent | 50/week |
| Response rate | 5%+ |
| Calls booked | 2/week |
| Close rate | 20%+ |

If response < 3%: weak subject lines. Regenerate with new hooks.
If close < 10%: weak demo. Record and review it.

## AGENT COMMANDS (Quick Reference)

```bash
# Generate 5 cold email scripts for a vertical
python -m phase3.cli generate-scripts --context "roofing contractor in Metro Atlanta" --num-variants 5

# Score a script before sending
python -m phase3.cli score 1 --backend manual --total 72 --humanity pass

# Log an outcome
python -m phase3.cli log-outcome 1 --business "Rays Roofing" --outcome booked --channel phone

# Batch generate from a CSV of prospects
python -m phase3.cli batch-call 1 --csv prospects.csv --limit 10

# Weekly report
python -m phase3.cli report
```

## ASCENT PLACEMENTS WEEKLY CHECKLIST

- [ ] 3 pieces of content posted (community management)
- [ ] 10 prospect emails sent
- [ ] 1 case study or result documented
- [ ] Dashboard updated
- [ ] Friday: report to Julius

## CONTENT IDEAS (A16Z formats)

1. Hero's Journey: "How [client] went from 0 to booked-out in 60 days"
2. Breakdown: "The 3-step system med spas use to fill their calendar"
3. Case Study: "[Client] achieved [outcome] in [way]"
4. Scenario: "What if your front desk never missed a lead?"

Post to: Instagram, LinkedIn, Ascent community channels.

