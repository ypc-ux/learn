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

