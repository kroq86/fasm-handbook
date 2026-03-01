# OOP-on-FASM POC: Entity + GameState Game

A proof-of-concept for an **OOP-style design on top of FASM**: two "classes" (**Entity** and **GameState**) with methods implemented in assembly, driven by a Python game loop with random damage.

## Concepts

- **Entity** — 8-byte struct: `type` (player/enemy), `health`. "Methods": `entity_get_health(this)`, `entity_set_health(this, health)`.
- **GameState** — 24-byte struct: two inline `Entity` instances (player, enemy), `status` (ongoing/over), `winner` (player/enemy/tie). "Methods": `game_state_init`, `game_state_get_player_health`, `game_state_get_enemy_health`, `game_state_tick(gs, player_damage, enemy_damage)`, `game_state_is_over`, `game_state_get_winner`.

All game state lives in ASM; Python allocates the `GameState` (via C), rolls damage each tick, and calls `game_state_tick`. No rule engine here — just one tick per round to keep the POC minimal.

## Build & Run

```bash
./build.sh
python3 game.py
```

## Layout (must match C and ASM)

- **Entity**: `type` (4), `health` (4) → 8 bytes.
- **GameState**: `player` Entity (8), `enemy` Entity (8), `status` (4), `winner` (4) → 24 bytes.

Calling convention: SysV x64 (rdi, rsi, rdx, …; rax return).

## Files

- `game.asm` implements the state model and methods in FASM.
- `wrapper.c` bridges the assembly symbols to Python-friendly functions.
- `game.py` runs the loop and prints the combat rounds.
- `build.sh` compiles the shared library.

## Why It Matters

This is the most structurally advanced example in the repository. It demonstrates that FASM can model stateful entities and exported methods, not just syscall-driven procedural programs.
