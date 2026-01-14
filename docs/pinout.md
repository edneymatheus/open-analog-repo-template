# Pinout

This file should match `admin/pinout_definition.csv` (single source of truth).

## Pin Table

| Pin | Type | Direction | Domain | Description | Notes |
|---|---|---|---|---|---|
| VDD | power | in | 1V2 | main supply |  |
| VSS | ground | in | gnd | ground |  |
| IN  | signal | in | core | input |  |
| OUT | signal | out | core | output |  |

## Notes
- Keep this file consistent with the CSV.
- For tapeout, copy this file into `tapeout/delivery/docs/`.
