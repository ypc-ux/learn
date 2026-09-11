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

