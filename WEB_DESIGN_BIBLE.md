# Web Design Bible — The Studio System

> **Version 2.0 | 2026 | Julius Young III**
> **License: Open Source (MIT) | Sell your own version at $97/mo**

This is the exact system used to build websites that clients pay $500 for in 2 hours. Not a guide. A repeatable system.

## THE ONE RULE

**Every website must feel like it cost $10,000 and took 40 hours. In reality: it costs $0.10 in API calls and takes 2 hours using this system.**

---

## COLOR SYSTEM

### Extract, Don't Guess

```bash
curl -s https://clientsite.com | python3 -c "
import sys, re
colors = re.findall(r'#[0-9a-fA-F]{6}', sys.stdin.read())
from collections import Counter
for c, n in Counter(colors).most_common(10): print(f'{c}: {n}')
"
```

### The 60-30-10 Split

| Role | % | Example |
|---|---|---|
| Background | 60% | #0B1426 |
| Cards | 30% | #0f1a2e |
| Accent/CTA | 10% | #0693e3 |

### Fallback Palette (No colors found)

Primary: #003388 | Secondary: #0693e3 | Highlight: #8ed1fc | BG: #0B1426

---

## CTA SYSTEM (The "BAM" Rule)

### Minimum 3 CTAs Per Page

| Position | Text |
|---|---|
| Hero | "Call (XXX) XXX-XXXX" |
| Mid-page | "Don't wait. Call now." |
| Footer | "Get Your Free Quote →" |

### Sizing

Desktop: `text-2xl md:text-3xl px-14 py-6 md:px-20 md:py-7`
Mobile: `text-xl px-10 py-5`

Every CTA = `<a href="tel:+1XXXXXXXXXX">Call</a>` — opens dialer on mobile.

---

## TRUST SYSTEM

### Two Trust Zones

| Position | Show |
|---|---|
| Below hero | BBB, review count, years, certifications |
| Above footer | Brand partners, guarantees, emergency service |

---

## ANIMATION STACK

| Tool | Package |
|---|---|
| Lenis | `npm install lenis` |
| GSAP + ScrollTrigger | `npm install gsap` |
| Framer Motion | `npm install framer-motion` |

### 8 Required Animations

1. Parallax hero (GSAP scrub)
2. Staggered reveal (IntersectionObserver)
3. Horizontal scroll (GSAP pin + scrub)
4. Animated counters (GSAP snap)
5. 3D rotate-in (Framer Motion)
6. Hover scale + shadow glow
7. Scroll progress bar
8. Floating scroll indicator

### Reveal Pattern

```css
.reveal { opacity: 0; transform: translateY(50px); transition: all 1s ease; }
.reveal.revealed { opacity: 1; transform: translateY(0); }
```

### Pinned Horizontal Scroll

```javascript
gsap.to('.hs-inner', {
  x: () => -(inner.scrollWidth - window.innerWidth + 120),
  ease: 'none',
  scrollTrigger: { trigger: section, start: 'top top', pin: true, scrub: 1 }
});
```

---

## IMAGE SYSTEM

### Never Stock Photos

```python
imgs = re.findall(r'src="([^"]*\.(?:jpg|jpeg|png|webp)[^"]*)"', html)
```

Scrape: logo, team photos, project photos, badges, backgrounds.

### Treatment

- Hero: gradient overlay (from-color/90 via-color/80 to-color/90)
- Cards: `object-cover group-hover:scale-110 duration-700`
- Team: `rounded-2xl border border-accent/20` + caption overlay

---

## TYPOGRAPHY

| Role | Font | Source |
|---|---|---|
| Headers | Oswald | next/font/google |
| Body | Inter | next/font/google |

Hero: `text-5xl md:text-7xl lg:text-8xl font-light`
CTA: `text-2xl md:text-3xl font-bold`

---

## CONTENT STRUCTURE (7 Sections)

1. Hero (parallax + CTA + trust indicators)
2. Stats (animated counters)
3. Services (pinned horizontal scroll + images)
4. Reviews (3D rotate-in Google testimonials)
5. Areas (animated pins)
6. About (team photo + BBB badge)
7. Contact/CTA (massive call button)

---

## THE 2-HOUR PIPELINE

| Time | Step |
|---|---|
| 0:00 | Scrape client site |
| 0:05 | Extract colors, images, content |
| 0:10 | Scaffold Next.js |
| 0:15 | Build hero + nav |
| 0:30 | Build stats + services |
| 0:45 | Build reviews + areas |
| 0:55 | Build about + CTA |
| 1:05 | Add animations |
| 1:20 | Deploy to Vercel |
| 1:35 | Commit + push |
| **2:00** | **Done.** |

---

## PRICING

| Product | Price |
|---|---|
| Website redesign | $500 |
| Hosting | $50/mo |
| Lead gen (AI calls) | $2,000 + $200/appt |
| iMessage outreach | $297/mo |
| Full package | $2,500 + $347/mo |

---

*This system generates $10,000-quality websites for $0.10 in API costs. Scale to 100 clients = $50,000/month.*

**— Julius Young III, Quartermaster AI Studio**

# COPY FRAMEWORK (A16Z Blueprint Applied)

## 3-Step Hook for Every Section Header

| Step | Example |
|---|---|
| 1. Context Lean-In | "Your roof leaks. We fix it." |
| 2. Scroll-Stop Interjection | "Most companies stop at the roof. We don't." |
| 3. Contrarian Snapback | "The guy on your roof is the owner's son." |

## 8 Principles for Website Copy

| # | Principle | Rule |
|---|---|---|
| 1 | Curiosity & Contrast | Headers that contradict expectations |
| 2 | Speed to Value | First line = the benefit |
| 3 | Value Density | No filler. Every word earns its place. |
| 4 | Clarity | 6th-grade level. "We fix roofs." |
| 5 | Absorption | Bullets, not paragraphs. |
| 6 | Anticipation | "The result?" forces reading. |
| 7 | Emotional Resonance | Family story. Human, not corporate. |
| 8 | Rhythm | Short sentences. Staccato. |

## Humanizer Voice Rules

| Bad | Good |
|---|---|
| We believe we can help | We guarantee it. |
| We are | We're |
| Our clients receive | You get |
| Committed to excellence | We show up on time. |

## Value Transfer on Websites

| Stage | Section |
|---|---|
| Tease | Hero headline |
| Sample | Stats — proof |
| Drip | Services — simple descriptions |
| Transfer | About + CTA — walkaway value |

## Four Horsemen (Website)

| Problem | Fix |
|---|---|
| Header too vague | 5 words or less |
| Visitor confused | 6th-grade. Simplify. |
| Not targeted | Use You/Your |
| Bounces | Add contrast. State A vs B. |

# CLOSEKIT

The process (scrape, build, propose, email, close) = CloseKit.

| Step | Time |
|---|---|
| Scrape + extract | 10 min |
| Build redesign | 2 hrs |
| Generate proposal | 30 min |
| Draft email + AI calls | 20 min |
| Total | 3 hrs |

$997 setup + $297/mo per contractor.

# DEPLOYMENT CHECKLIST

- [ ] Colors from client site (extracted)
- [ ] 3+ CTAs (tel: links, text-2xl+)
- [ ] Trust logos (hero + footer)
- [ ] Lenis + GSAP + Framer Motion
- [ ] Parallax, pinned scroll, counters, reveals
- [ ] Real client photos
- [ ] Gradient text + orbs + grid
- [ ] Glassmorphism nav + brand marquee
- [ ] Spotlight hover on cards
- [ ] Grain texture
- [ ] Copy: Hook + 8 principles + humanizer
- [ ] Background is NOT an empty void — mesh + orbs + grid + geo shapes
- [ ] Mobile 375px test
- [ ] Lighthouse 90+
- [ ] Deploy + email

# BACKGROUND SYSTEM (Never an Empty Void)

A dark background with nothing on it feels dead. Every dark site needs layered background elements:

| Layer | CSS Class | Purpose |
|---|---|---|
| 1. Base gradient | `bg-gradient-to-br` | Foundation depth |
| 2. Gradient mesh | `.mesh-bg` | Slow-drifting color blobs (30s loop) |
| 3. Architectural grid | `.grid-bg` | Blueprint feel (3% opacity) |
| 4. Gradient orbs | `.orb .orb-1 .orb-2` | Light sources (blur 100px) |
| 5. Geo shapes | `.geo-shape` | Drifting geometric forms (25s loop) |
| 6. Film grain | `body::after` | Cinematic texture (4% opacity) |

**Rule:** If the background looks like `#000` with nothing on it, you failed. Layer minimum 3 background elements.

**Light mode sites:** Same principle — use soft gradient washes, subtle patterns, or image overlays. Never flat white.

**Dark vs Light (Research):** Dark WON the A/B conversion test (Search Engine Land). Dark = premium, CTA contrast pops. Use dark for contractors/tech. Use light for medical/legal/family services.

# ANTI-AI-SLOP RULES

If your website looks like ChatGPT designed it, you failed. Here's what to avoid:

| Rule | AI Slop (Bad) | Anti-Slop (Good) |
|---|---|---|
| Photos | Generic stock images | Client's real photos only |
| Copy | "We provide quality solutions" | "We fix roofs. Same family. Same truck." |
| Layout | Everything centered, symmetrical | Asymmetric grids, varied spacing |
| Icons | 🏠 🔧 ⚡ emoji icons | Custom SVG or real photos |
| Sections | Hero → Services → About → CTA | Each section has personality |
| Voice | "Leverage synergies" | "Show up and sell" |
| Background | Flat #000 or #0B1426, empty void | 6-layer background system |
| Motion | Static, no animation | GSAP + Lenis + Framer Motion |
| CTAs | Small text-sm buttons | text-2xl minimum, BAM |
| Alignment | Everything text-center | Mix left-aligned body + centered headers |
| Colors | Tailwind defaults (emerald, indigo) | Client's actual brand colors (extracted) |
| Typography | System default font | Oswald display + Inter body |
| Gradients | Purple-to-pink (the AI default) | Client's brand colors or blue system |
| Testimonials | "Great service!" | Real quotes with names + platform |
| Stats | "Many projects completed" | "500+ projects. 8 years. 12 team." |

## THE TEST:** If someone sees your site and thinks "an AI made this," rebuild it. The site should feel like a human who knows design spent 40 hours on it.

# RULE 0: STEAL FIRST, BUILD NEVER

Before writing ANY custom animation, component, or layout block from scratch, search these two proven libraries first. Copy their component, adapt colors, ship it.

**Your custom code is a bug factory. Their code is battle-tested by 120,000+ developers.**

## The Libraries

| Library | Stars | Install | Best For |
|---|---|---|---|
| [Magic UI](https://magicui.design/docs/components) | 22K+ | `npx shadcn add "https://magicui.design/r/[component]"` | Marquees, tickers, blur-fade reveals, magic cards, shine borders, particles, text effects |
| [Aceternity UI](https://ui.aceternity.com/components) | 120K users | Copy-paste from site | Hero sections, pricing sections, bento grids, spotlights, text effects, background beams |

## Install Workflow

```bash
# One-time: init shadcn
npx shadcn@latest init -y --defaults

# Add Magic UI components (they become yours, fully editable)
npx shadcn@latest add \
  "https://magicui.design/r/marquee" \
  "https://magicui.design/r/number-ticker" \
  "https://magicui.design/r/blur-fade" \
  "https://magicui.design/r/magic-card" \
  "https://magicui.design/r/shine-border" \
  "https://magicui.design/r/animated-gradient-text"
```

Dependencies needed: `motion` (framer-motion), `clsx`, `tailwind-merge`

## Component Mapping (Custom → Stolen)

| Custom Code (DON'T BUILD) | Magic UI Component (STEAL THIS) |
|---|---|
| Custom marquee CSS + keyframes | `Marquee` (pause-on-hover, speed control) |
| Custom counter with GSAP | `NumberTicker` (spring physics, delay stagger) |
| Custom reveal with IntersectionObserver | `BlurFade` (staggered children, direction control) |
| Custom gradient text class | `AnimatedGradientText` (animated background position) |
| Custom spotlight hover | `MagicCard` (gradient follows cursor) |
| Custom glow/shine border | `ShineBorder` (conic gradient rotation) |
| Custom pricing card layout | Aceternity Pricing Section |
| Custom hero section | Aceternity Hero Section (23+ blocks) |
| Custom particle background | Magic UI `Particles` or `Meteors` |

## Playwright QA Test (MANDATORY before deploy)

```javascript
// qa-test.js — run with: node qa-test.js (after npm run start)
const { chromium } = require('playwright');
(async () => {
  const browser = await chromium.launch();
  const results = [];
  const add = (test, pass, detail) => {
    results.push({ test, pass, detail });
    console.log(`${pass ? '✅' : '❌'} ${test} — ${detail}`);
  };

  for (const vp of [
    { w: 1920, h: 1080, name: 'Desktop 1920' },
    { w: 1440, h: 900, name: 'Laptop 1440' },
    { w: 375, h: 812, name: 'Mobile 375' },
  ]) {
    const page = await browser.newPage({ viewport: { width: vp.w, height: vp.h } });
    await page.goto('http://localhost:3000', { waitUntil: 'networkidle' });
    await page.waitForTimeout(1500);

    // 1. CENTERING: H1 must be within 5% of viewport center
    const h1Box = await page.locator('h1').first().boundingBox();
    if (h1Box) {
      const offset = Math.abs((h1Box.x + h1Box.width / 2) - vp.w / 2);
      add(`[${vp.name}] H1 centered`, offset < vp.w * 0.05, `offset: ${Math.round(offset)}px`);
    }

    // 2. NO BROKEN TAILWIND CLASSES (bg-#hex instead of bg-[#hex])
    const broken = await page.evaluate(() =>
      document.querySelectorAll('[class*="bg-#"], [class*="text-#"], [class*="border-#"]').length
    );
    add(`[${vp.name}] No broken Tailwind`, broken === 0, `${broken} broken classes`);

    // 3. CTA BUTTON HAS VISIBLE BACKGROUND
    const cta = page.locator('.cta-pulse').first();
    if (await cta.count() > 0) {
      const bg = await cta.evaluate((el) => getComputedStyle(el).backgroundColor);
      add(`[${vp.name}] CTA visible`, bg !== 'rgba(0, 0, 0, 0)', `bg: ${bg}`);
    }

    // 4. NO EMOJI ICONS
    const bodyText = await page.locator('body').textContent();
    const emojis = (bodyText.match(/[\u{1F300}-\u{1F9FF}]/gu) || []).length;
    add(`[${vp.name}] No emoji icons`, emojis === 0, `${emojis} emojis`);

    // Screenshot for visual review
    await page.screenshot({ path: `qa-${vp.name.replace(/\s/g, '-')}.png` });
    await page.close();
  }

  const failed = results.filter(r => !r.pass);
  console.log(`RESULTS: ${results.length - failed.length}/${results.length} passed`);
  await browser.close();
})();
```

**Run:** `npm run build && npm run start & sleep 4 && node qa-test.js`

**Pass requirement: 100%. Any failure = fix before deploy.**

## Root Cause of Off-Center Layout (and the fix)

**Problem:** Content shifted left because `body` was a normal block element. Child elements with `margin: auto` center within their parent, but `main` was `width: 100%` so `margin: auto` did nothing — content aligned left by default inside a full-width container.

**Fix:** Make `body` a flex column container with `align-items: center`. This centers ALL children (nav, main, sections) without needing margin hacks on each element.

```css
body {
  display: flex;
  flex-direction: column;
  align-items: center;
}

main {
  width: 100%;
  margin: 0 auto !important;
}
```


---

# Industry Animation Blueprints (The Vertical System)

Every vertical site uses the **same skeleton**: nav → hero → pain → solution → proof → offer → CTA. What changes per vertical: palette, animation stack, and copy. Skin the skeleton, don't rebuild it.

## The Research Basis (read this before picking animations)

- **Peripheral motion demands attention.** Moving elements in peripheral vision trigger a stimulus-driven attention shift (Pratt et al., 2010). This is why ambient background animation works for attention-hungry audiences and fails for task-focused ones.
- **Slow transitions = less distracting. Fast = attention-grabbing.** NN/g: slow for things the user didn't trigger, fast for things they did. A slow gradient on a headline is ambience. A fast shimmer on a CTA is a spotlight.
- **Repetition kills.** The user sees your hero animation once per visit. Keep repeated elements static.
- **85% of consumers cite color as the primary reason they buy; 62-90% of snap judgments are based on color alone** (CCICOLOR via Colorlib 2026). Color is the first conversion lever.
- **Blue is the trust color.** 57% of men pick it as their favorite (Hallock); 75%+ of major banks use it.
- **Purple has the biggest gender gap:** 23% of women vs 1% of men (Hallock). Purple-heavy sites skew female or creative.
- **Red CTAs beat green by 21%** (HubSpot A/B test). Contrast against the page matters more than the hue.
- **Only 29% of websites meet WCAG AA contrast** (WebAIM). Fix contrast before adding a single animation.
- **Dark mode adoption: 82%** among users who have the option. Dark-first is safe everywhere except restaurants.

## The 7 Verticals

### 1. Home Services — roofing, HVAC, plumbing, electrical, windows

- **Avatar:** Male homeowner, 35-65, married, $75-150K household. Fears getting ripped off more than the price.
- **ICP thought:** "I need this fixed NOW and I don't want to get played."
- **Emotion:** Trust + urgency.
- **Palette:** `#003388` primary, white, steel gray, red accent for urgency elements only.
- **Animation stack:** Marquee (brand/review logos), NumberTicker (jobs completed, years — proof via big numbers), MagicCard (service cards with cursor spotlight), ShineBorder (guarantee boxes), BorderBeam (CTA section), BlurFade (section reveals).
- **Anti-patterns:** Particles, Meteors, AuroraText. A 55-year-old homeowner reads floating dots as "something's wrong with my computer."
- **Copy template:**
  - Hook: "Most contractors call leads back in 42 minutes. Homeowners hire someone else by minute 10."
  - Sub: one number + one guarantee. "2,847 roofs. 15 years. If we don't show up, you don't pay."
  - CTA: "Get My Free Inspection"

### 2. Creative / Gen Z — content creators, TikTok Shop, musicians

- **Avatar:** 18-28, creator or aspiring, urban, $20-80K. Optimizes for looking cool.
- **ICP thought:** "Show me something I haven't seen."
- **Emotion:** Excitement + FOMO.
- **Palette:** `#a855f7` purple, neon blue `#8ed1fc`, hot pink `#e879f9`, near-black `#0B1426` base.
- **Animation stack:** Meteors (hero), Particles (ambient), AuroraText (headline), TextAnimate blurInUp, MagicCard, BorderBeam (waitlist box), ShimmerButton (CTA), Confetti (on submit — the delight moment), OrbitingCircles (feature diagram).
- **Anti-patterns:** NumberTicker (reads corporate), static hero sections, slow loads.
- **Copy template:**
  - Hook: "Your scripts. Your rizz. One app." (under 8 words, rhythm of 3)
  - Sub: name the enemy. "Stop switching between 5 apps."
  - CTA: real scarcity. "200 beta spots. Free."

### 3. Professional Services — accountants, lawyers, consultants, agencies

- **Avatar:** Business owner, 30-55, college-educated, $100-500K. Pays for credibility.
- **ICP thought:** "Convince me you won't waste my time."
- **Emotion:** Authority + sophistication.
- **Palette:** `#0B1426` black-navy (black reads 50% more luxurious — Reboot), white, gold accent.
- **Animation stack:** NumberTicker (case results, client counts), TextReveal (credentials word by word), BlurFade, BentoGrid (service breakdown), AnimatedBeam (process diagram), ProgressiveBlur (background depth).
- **Anti-patterns:** Everything flashy. One meteor on a lawyer's site ends the conversation.
- **Copy template:**
  - Hook: a case result with a number. "We recovered $2.3M for a 40-person firm."
  - Sub: methodology in one line.
  - CTA: "Book a 15-Minute Call"

### 4. Health & Wellness — dental, med spas, gyms, therapy

- **Avatar:** Female, 28-55, health-conscious, $60-150K. Decides on "does this place feel clean."
- **ICP thought:** "I want to feel safe and cared for."
- **Emotion:** Calm + trust.
- **Palette:** Teal `#0d9488`, white, cream, soft pink. Only 7% of top brands use green — ownable in local markets.
- **Animation stack:** AnimatedGradientText (slow headline gradient), BlurFade, InfiniteMovingCards (testimonial stream), MagicCard with soft glow (treatment cards), ParallaxScroll (before/after galleries).
- **Anti-patterns:** Meteors, fast animations, harsh geometry.
- **Copy template:**
  - Hook: the outcome, not the treatment. "Walk out smiling same day."
  - Sub: safety + convenience. "Evening appointments. Financing available."
  - CTA: "Book My Consult"

### 5. Luxury / Premium Builds — high-end remodel, custom homes, architecture

- **Avatar:** $200K+ homeowner, 40-65, design-conscious. Buys taste, not price.
- **ICP thought:** "Show me your taste before you show me a quote."
- **Emotion:** Aspiration + exclusivity.
- **Palette:** Pure black, gold `#d4a853`, charcoal, warm white.
- **Animation stack:** HeroParallax (project photos at different scroll speeds — Aceternity), 3DMarquee (portfolio grid), ContainerScrollAnimation (hero rotates in 3D on scroll), TracingBeam (project timeline), GlareHover (light across cards), NoiseTexture (editorial grain).
- **Anti-patterns:** NumberTicker (reads salesy), bright colors, playful motion.
- **Copy template:**
  - Hook: one project, one sentence, no adjectives that do the photo's job.
  - Sub: scarcity of attention, not of slots. "We take 12 projects a year."
  - CTA: "Request a Private Consultation"

### 6. Real Estate & Property

- **Avatar:** Buyer/seller, 28-55, anxious about the biggest transaction of their life.
- **ICP thought:** "Show me data and homes, and make me feel confident."
- **Emotion:** Information + visualization.
- **Palette:** Deep blue `#1e3a5f`, white, warm gray, green accent for sold/growth.
- **Animation stack:** NumberTicker (market stats, days on market), BentoGrid (property features), ParallaxScroll + ImageSlider (property galleries), AnimatedBeam (buying process timeline).
- **Anti-patterns:** Entertainment animation. This audience wants to scan, not watch.
- **Copy template:**
  - Hook: a market fact they can verify. "Homes in [county] sold in 9 days last quarter."
  - Sub: process clarity. "List. Prep. Sold. 3 steps."
  - CTA: "Get My Home's Value"

### 7. Restaurants & Food

- **Avatar:** Hungry local, 21-55, mobile-first, deciding in seconds.
- **ICP thought:** "Looks good. Where is it. How fast."
- **Emotion:** Appetite + urgency.
- **Palette:** Red `#E53E3E` + yellow `#ECC94B` (the McDonald's stack — red stimulates appetite, yellow grabs attention). Cream, dark brown. **Never blue** — suppresses appetite.
- **Animation stack:** 3DMarquee (food photo grid), FlipWords (menu highlights: "Fresh • Local • Daily"), AnimatedList (menu reveals), ContainerScrollAnimation (hero dish shot), BackgroundGradient (warm tones), ShimmerButton (Order Now).
- **Anti-patterns:** Cool/dark themes, slow calm animations, purple.
- **Copy template:**
  - Hook: the dish, the price, or the speed. "Wood-fired in 90 seconds."
  - Sub: location + hours, above the fold.
  - CTA: "Order Now" / "Reserve a Table"

## The Selection Algorithm

1. Identify the avatar's gender skew and age (color preference data).
2. Identify the core fear or desire (rip-off, boredom, wasted time, safety, status, information, hunger).
3. Pick palette from the vertical table. Contrast-check it (WCAG AA, 4.5:1 body text).
4. Pick 4-6 animations max. One ambient (background), one hero moment, one interactive (cards), one CTA treatment, one scroll reveal.
5. Run the anti-pattern check. Delete anything on the list.
6. QA: run the Playwright test. 100% or don't ship.

---

# The Copy Stack

Design gets attention. Copy converts it. These rules apply to every site we ship.

## Voice (Humanizer Rules)

1. **Keep every claim, cut every inflation.** No "game-changer," no "revolutionary," no "seamlessly." Say what it does, with numbers.
2. **One idea per sentence. Vary the length.** Short. Then a longer one that lands the point and carries the proof with it.
3. **Second person always.** "Your roof," not "our valued customers' roofs."
4. **No stock AI phrases:** "in today's fast-paced world," "look no further," "unlock the power of," "elevate your," "we've got you covered." If it could appear on any site in any industry, delete it.
5. **Specific beats impressive.** "2,847 roofs in 15 years" > "decades of experience." "Calls leads back in 5 minutes" > "lightning-fast response."
6. **Numbers over adjectives.** Every adjective should make you ask: what's the number instead?
7. **Read it aloud.** If you wouldn't say it to the client's face, it doesn't ship.

## Section-by-Section Formulas

| Section | Job | Formula |
|---|---|---|
| Hero hook | Stop the scroll | Their pain or a number they can't argue with, under 8 words |
| Hero sub | Pay off the hook | The mechanism + one proof point |
| Pain section | Make them nod | 4 pains in THEIR words ("You write scripts in Notes app"), never your words |
| Solution | Show the mechanism | Features as outcomes: "Speed control, mirror mode" not "Advanced settings" |
| Proof | Borrowed credibility | Numbers, logos, one named result. No fake testimonials, ever. |
| Offer | Make the yes small | Price + what's included + guarantee + risk reversal |
| CTA | Own the action | First-person verb: "Get My Free Inspection," "Join Waitlist," "Book My Consult" |

## The Hook Library (A16Z architecture)

Every hook: **Context Lean-In → Scroll-Stop ("But/Here's the thing") → Contrarian Snapback → Value Transfer → Ease Close.**

Ten shapes that work:

1. **The Competitor Callout** — "Your competitor booked the lead you missed."
2. **The Time Bomb** — "Most contractors call back in 42 minutes. Homeowners hire by minute 10."
3. **The Cost of Inaction** — "Every week your website looks like 2015, you're paying for it."
4. **The Insider Leak** — "Roofers in Gwinnett are booking 20 appointments a month with this."
5. **The Contrarian** — "You don't need more leads. You need to answer the ones you have."
6. **The Enemy** — "It's not your ads. It's your callback speed."
7. **The Us vs Them** — "Agencies charge $5K/month to do what this does for $297."
8. **The Confession** — "I built this because I got tired of watching good contractors lose to bad marketers."
9. **The Question Filter** — "What would 20 extra appointments a month do to your calendar?"
10. **The Trojan Gift** — "Here's the exact system, free. Steal it." (next section)

## Copy Correctness Checklist (run before every deploy)

- [ ] Phone number identical everywhere, one format: (XXX) XXX-XXXX
- [ ] Prices identical everywhere ($500 / $2,000 / $297/mo)
- [ ] No placeholders: grep for "lorem", "TODO", "your@email", "Example", "XX%"
- [ ] No emoji as icons — SVG only
- [ ] Every claim traceable to a real number or the client's real data
- [ ] Names spelled correctly (client, city, county)
- [ ] CTAs first-person, visible, background transparency verified
- [ ] Footer credits the real builder, links work
- [ ] Title tag = hook + brand, under 60 chars
- [ ] Meta description = the pitch, under 155 chars

---

# Trojan Horse Marketing

## The Mental Model

A Trojan Horse is an innocuous container that hides your true intent until it's past the defenses (Farnam Street). The Greeks didn't breach Troy's walls in ten years of assault. They built a gift the Trojans valued — made from sacred wood, shaped like a sacred animal — and the Trojans dragged it inside themselves.

Marketing translation: your prospects have walls — ad blockers, spam filters, the scroll reflex. You don't break in. You build something they drag in.

**Jonah Berger, Contagious:** "Information travels under the guise of what seems like idle chatter... we need to make our message so integral to the narrative that people can't tell the story without it."

**The core insight:** People have strong defenses against anything that looks like a pitch. They have no defenses against a genuine gift.

## Was It Already in Our Hook Strategy?

Partially. The A16Z formula's "Value Transfer" line (lines 4-5 of the cold email) was doing Trojan Horse work without the name — the contrarian snapback drops the gate, the value transfer is the payload that gets dragged inside. But no doc named it, and no offer was designed around it. Now they are. The Trojan Horse is the layer between the hook (gets you read) and the offer (gets you paid).

## The 8-Step Trojan Horse Playbook (Bustamante method)

Daniel Bustamante landed his first $10K ghostwriting client — and then $100K+ total — with this:

1. **Break down your offer stack.** List every deliverable in your paid service. Everything — the strategy calls, the reports, the small stuff.
2. **Extract a slice.** The Trojan Horse Offer is a piece of your actual paid service, not a random freebie. It must be valuable standalone.
3. **Size it right.** Fulfillable in a few days. Meaningful enough that they want it. Repeatable across most of your ICP.
4. **Pick ONE.** The slice most of your ideal clients are missing.
5. **Write the pitch script.** Personalized email/DM + an offer they'd feel stupid refusing.
6. **Pitch it.** No mention of the paid service in the first message. The gift is the message.
7. **Overdeliver.** Fulfill it like it was the $10K project. This is the whole game.
8. **Let them ask for the upsell.** The client who says "what else can you help with?" closes himself.

A valid Trojan Horse Offer is: (a) part of your real service, (b) valuable on its own even if they never pay you, (c) doable in under a week, (d) needed by nearly all of your ICP.

## Our Trojan Horse Stack

| The Gift (they drag it in) | The Payload (behind the walls) | Status |
|---|---|---|
| $500 website redesign | $2,000 lead gen system — the site is the foot in the door | Pitched to Matt, Dustin |
| CloseKit (free, open source) | Authority + notoriety → inbound for the paid studio | Live |
| RizzScript free beta (200 spots) | Paid creator app + waitlist pipeline | Landing live |
| Learn hub + Web Design Bible | Positions us as the packaging-layer experts; YC thesis proof | Live |
| Free AI receptionist test call | Bland.ai setup engagements at ~97% margin | API key ready |
| Vertical demo sites | Proof of the $500 offer at scale — "see your industry's site" | System built |

**The pattern:** every asset is both a real gift and a paid thing in disguise. If you can't name the payload, the asset is a hobby, not a Trojan Horse.

## Trojan Horse Rules

1. **The gift must be real.** A fake gift (thin PDF, teaser audit) reads as a pitch with better camouflage. The walls go back up and they never open again.
2. **Fit the gift to the audience.** The Greeks used sacred wood for a sacred audience. A roofer doesn't want a "growth audit" — he wants to see his competitor's site next to his.
3. **The payload never ships in the first touch.** First message = gift only. The upsell happens after overdelivery, when they ask.
4. **Stories are Trojan horses.** Case studies beat ads because the moral rides inside a story the prospect chose to hear. "One roofing company in Conyers got 20 booked appointments in 30 days" is a story first, a pitch second.
5. **The gift is a slice, not the whole.** Give away the diagnosis, sell the surgery. Give away the website, sell the lead gen. Give away the system, sell the service.
6. **If the gift looks too good to be true, it backfires.** Farnam Street's heuristic cuts both ways — price the paid thing fairly so the gift reads as generosity, not a trap.

## Where the Trojan Horse Lives in Our Copy

- **Cold email:** the gift in lines 4-5. The 42-minute stat IS the gift — actionable even if they never call you.
- **Landing pages:** free beta, free inspection, free value calculator.
- **Content:** teach the whole system publicly (CloseKit, this Bible). People who could DIY but won't become clients. People who can't DIY become evangelists.
- **Proposals:** the demo site is built BEFORE the call. "Your new website is already live at this URL" is the strongest Trojan Horse we have.

