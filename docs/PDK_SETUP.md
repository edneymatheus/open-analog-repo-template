# PDK Bridge (Sky130 / IHP SG13G2)

This template is *PDK-agnostic by default* (so you can run `make smoke` with no PDK).
When you switch to a real PDK, the goal is to avoid the “blank screen panic” by following a repeatable checklist:

1) **Export environment variables** (PDK root + chosen PDK name)  
2) **Point each tool to the same PDK** (Ngspice models, Magic tech, KLayout tech)  
3) **Run a small sanity check** (open a layout, run a tiny sim, verify the tool sees the PDK)

---

## 1) Single Source of Truth: `env/env.sh`

This repo uses `env/env.sh` as the *only* place where you define the PDK path and selection.

Edit:

- `PDK_ROOT` → where your PDKs live
- `PDK` → which PDK you want (example: `sky130A`, `ihp_sg13g2`)

Then:

```bash
source env/env.sh
```

If `PROJECT_ROOT`, `PDK_ROOT`, and `PDK` are set correctly, everything else becomes “configuration plumbing”.

---

## 2) Sky130 (common setups)

### Typical options
You may have Sky130 installed via:
- a local `open_pdks` build
- a tool container (e.g., open-source EDA containers)
- a PDK bundle checked out in a workspace

**Action:** set `PDK_ROOT` to the directory *containing* the `sky130A/` folder and set `PDK=sky130A`.

### Tool mapping
- **Ngspice**: update `env/.spiceinit` to include the Sky130 model includes you need (typical: device models + corners)
- **Magic**: update `env/.magicrc` to load the Sky130 technology (usually via the PDK’s provided magicrc or tech load script)
- **KLayout**: point KLayout to the correct tech/lyp files (often via macro/technology import depending on your install)

### Sanity checks (recommended)
- `magic` opens with the Sky130 tech loaded (layers/menu look correct)
- `klayout` can load a Sky130 layout and shows correct layers
- `ngspice` can run a small testbench including a Sky130 model file without “can't open” errors

---

## 3) IHP SG13G2 (common setups)

### Typical options
IHP SG13G2 is often used via:
- a dedicated PDK installation in your lab/workstation
- a container-based flow (common in open-source environments)

**Action:** set `PDK_ROOT` to the directory containing the SG13G2 PDK, and set `PDK=ihp_sg13g2` (or whatever your local naming uses).

### Tool mapping
- **Ngspice**: update `env/.spiceinit` to include SG13G2 models (and your preferred corner/temperature controls)
- **Magic**: load the SG13G2 tech via `env/.magicrc` (technology name and load method depend on your install)
- **KLayout**: ensure the SG13G2 technology/layer properties are available

### Sanity checks (recommended)
- Open a known-good SG13G2 GDS in KLayout (layers render correctly)
- Run a minimal ngspice sim with a model include path that resolves
- Confirm your `PDK` selection doesn’t require hardcoding paths in user dotfiles

---

## 4) Common pitfalls (and how to avoid them)

### Pitfall: Hardcoded absolute paths
**Fix:** keep paths inside `env/` and reference `$PROJECT_ROOT` and `$PDK_ROOT`.

### Pitfall: Tools load different PDK versions
**Fix:** only define the PDK once in `env/env.sh`, and make all tool configs reference it.

### Pitfall: “It works on my machine”
**Fix:** document your PDK setup in `docs/` and keep the repo runnable from a clean clone.

---

## 5) Next step (recommended)
When you connect a real PDK, create a short note in `docs/`:

- which PDK version you used
- how it is installed (local path or container)
- which files you referenced in `.spiceinit` / `.magicrc`

This is the difference between a repo that survives 6 months and one that rots.
