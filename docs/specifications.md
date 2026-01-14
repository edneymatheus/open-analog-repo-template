# Specifications (Template)

> This file is the single reference for electrical targets (Min/Typ/Max).
> Fill it before packaging a tapeout candidate.

## Block / Chip
- Name:
- PDK: (Sky130 / IHP SG13G2 / other)
- Supply domains:

## Electrical Targets (Min / Typ / Max)
| Parameter | Min | Typ | Max | Unit | Notes |
|---|---:|---:|---:|---|---|
| VDD |  |  |  | V |  |
| IDD |  |  |  | mA |  |
| BW |  |  |  | Hz |  |
| Gain |  |  |  | dB |  |
| Noise |  |  |  |  |  |

## Verification Plan (Checklist)
- [ ] PVT corners (SS/TT/FF/SF/FS)
- [ ] Temperature sweep
- [ ] Monte Carlo / mismatch
- [ ] Post-layout PEX vs schematic
