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
