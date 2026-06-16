---
title: Real macOS Tools With FASM
permalink: /fasm-mac/
---

# Build Real macOS Tools With FASM

This handbook teaches FASM and Linux/ELF64 patterns. The companion project
[fasm-mac](https://github.com/kroq86/fasm-mac) shows the same low-level ideas
as finished macOS developer tools: Mach-O output, Darwin syscalls, kqueue
servers, reusable core includes, release checks, and Homebrew formulae.

Use this page as the bridge: learn concepts here, then follow the links into
`fasm-mac` when you want runnable macOS tools.

## macOS FASM In 5 Minutes

Install the companion toolchain with Homebrew:

```sh
brew tap kroq86/fasm-mac https://github.com/kroq86/fasm-mac
brew install fasm-mac
```

Create a local `hello.asm`:

```asm
format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
    write_file STDOUT, msg, msg_len
    exit 0

segment readable writeable
msg db "hello from macOS FASM", 10
msg_len = $ - msg
```

Build and run it:

```sh
fasm run hello.asm
```

On Apple Silicon, `fasm-mac` emits x86_64 Mach-O binaries that run through
Rosetta. The project does not rewrite FASM classic as arm64; it keeps the
upstream compiler core and wraps it with a practical macOS pipeline.

The bridge is intentionally simple:

1. FASM emits ELF64 executable or ELF64 relocatable output.
2. `fasm/tools/elf64_to_macho64.py` converts the supported ELF layout.
3. macOS runs or links the resulting x86_64 Mach-O file.

The source of truth for install commands and current CLI details is the
[`fasm-mac` README](https://github.com/kroq86/fasm-mac#readme).

## Core Stdlib As A Learning Path

`fasm-mac` is more than a collection of demos. Its reusable includes under
[`fasm/core`](https://github.com/kroq86/fasm-mac/tree/main/fasm/core) form a
small standard library for assembly programs.

Good reading order:

- platform layer and syscall helpers for Linux/macOS portability;
- strings, files, scanners, and directory walking;
- hash maps, stacks, lists, trees, grids, and dynamic programming helpers;
- coroutine scheduling and kqueue-based socket servers;
- Mach-O parsing and binary inspection routines;
- C ABI helpers for linking FASM routines into C, Zig, and raylib programs.

The important design lesson is boundary discipline: reusable behavior belongs
in core includes, while apps stay thin and product-shaped.

## Algorithms As Onboarding

The LeetCode-style examples are useful because the problem is familiar before
the assembly starts. Each example can be read with the same checklist:

- problem: what algorithm is being demonstrated;
- memory layout: arrays, nodes, stacks, maps, or grids;
- register contract: inputs, outputs, and clobbers;
- core helper: which reusable include carries the behavior;
- runnable source: link back to the canonical file in `fasm-mac`.

Start with
[`fasm/examples/leetcode`](https://github.com/kroq86/fasm-mac/tree/main/fasm/examples/leetcode)
when you want algorithmic assembly that is small enough to study and still tied
to reusable infrastructure.

## Brew-Worthy Case Studies

These apps are the best entry points for readers who want real tools rather
than toy examples:

| Tool | Why it matters |
| --- | --- |
| [`machodoctor`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/machodoctor.asm) | Mach-O binary inspection with human, JSON, dependency, and check modes. |
| [`fscan`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/fscan.asm), [`logknife`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/logknife.asm), [`hexpeek`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/hexpeek.asm) | Small Unix-style tools that exercise files, scanners, search, JSON, and hex output. |
| [`logbus`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/logbus.asm) | A durable append-only message broker using cooperative tasks and kqueue. |
| [`logvec`](https://github.com/kroq86/fasm-mac/blob/main/docs/logvec.md) | A hybrid FASM/Zig path: FASM owns vector math, Zig owns index I/O and orchestration. |
| [`macdbg`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/macdbg.asm) | Advanced and experimental: an AI-native LLDB snapshot debugger built around a native UI. |

## Release Discipline

The most important product lesson is not just "assembly can run." It is that
assembly projects can ship like normal developer tools.

`fasm-mac` keeps that discipline visible:

- focused `scripts/check_*.sh` gates for apps and core behavior;
- `Formula/*.rb` Homebrew packaging for finished tools;
- release builders such as `scripts/build-*-release.sh`;
- app code that consumes reusable core helpers instead of hiding private
  frameworks in each product.

That makes `fasm-mac` the practical lab for this handbook: the handbook teaches
the concepts, and the companion repo shows how those concepts become tools
people can install.

---

# Реальные macOS-инструменты на FASM

Этот handbook учит FASM и Linux/ELF64-паттернам. Соседний проект
[fasm-mac](https://github.com/kroq86/fasm-mac) показывает те же низкоуровневые
идеи как готовые macOS-инструменты: Mach-O output, Darwin syscalls,
kqueue-серверы, переиспользуемые core includes, check scripts и Homebrew
formulae.

Эта страница - мост: учить концепции здесь, а за runnable macOS-инструментами
переходить в `fasm-mac`.

## macOS FASM За 5 Минут

Установка через Homebrew:

```sh
brew tap kroq86/fasm-mac https://github.com/kroq86/fasm-mac
brew install fasm-mac
```

Создайте локальный `hello.asm`:

```asm
format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
    write_file STDOUT, msg, msg_len
    exit 0

segment readable writeable
msg db "hello from macOS FASM", 10
msg_len = $ - msg
```

Сборка и запуск:

```sh
fasm run hello.asm
```

На Apple Silicon `fasm-mac` создаёт x86_64 Mach-O бинарники, которые запускаются
через Rosetta. Это не arm64-переписывание FASM classic: проект сохраняет
upstream compiler core и добавляет практический macOS pipeline.

Схема моста:

1. FASM создаёт ELF64 executable или ELF64 relocatable output.
2. `fasm/tools/elf64_to_macho64.py` конвертирует поддерживаемый ELF layout.
3. macOS запускает или линкует получившийся x86_64 Mach-O файл.

Актуальная CLI-документация живёт в
[`fasm-mac` README](https://github.com/kroq86/fasm-mac#readme).

## Core Stdlib Как Учебный Маршрут

`fasm-mac` - это не просто набор демо. Переиспользуемые includes в
[`fasm/core`](https://github.com/kroq86/fasm-mac/tree/main/fasm/core) постепенно
собираются в маленькую standard library для assembly-программ.

Хороший порядок чтения:

- platform layer и syscall helpers для Linux/macOS portability;
- строки, файлы, scanner и directory walking;
- hash maps, stacks, lists, trees, grids и dynamic programming helpers;
- coroutines и kqueue-based socket servers;
- Mach-O parser и binary inspection routines;
- C ABI helpers для связи FASM с C, Zig и raylib-программами.

Главный урок - дисциплина границ: переиспользуемое поведение живёт в core
includes, а apps остаются тонкими и продуктово понятными.

## Алгоритмы Как Onboarding

LeetCode-style примеры удобны, потому что задача понятна ещё до assembly. Каждый
пример можно читать по одному шаблону:

- problem: какой алгоритм демонстрируется;
- memory layout: arrays, nodes, stacks, maps или grids;
- register contract: inputs, outputs и clobbers;
- core helper: какой reusable include несёт поведение;
- runnable source: ссылка на canonical file в `fasm-mac`.

Начинать удобно с
[`fasm/examples/leetcode`](https://github.com/kroq86/fasm-mac/tree/main/fasm/examples/leetcode):
это небольшие алгоритмические примеры, но они уже связаны с reusable
infrastructure.

## Brew-Worthy Кейсы

Лучшие входные точки для читателей, которым нужны реальные инструменты, а не
игрушечные демо:

| Tool | Почему важен |
| --- | --- |
| [`machodoctor`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/machodoctor.asm) | Инспекция Mach-O binaries с human, JSON, dependency и check modes. |
| [`fscan`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/fscan.asm), [`logknife`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/logknife.asm), [`hexpeek`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/hexpeek.asm) | Маленькие Unix-style tools: files, scanners, search, JSON и hex output. |
| [`logbus`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/logbus.asm) | Durable append-only message broker на cooperative tasks и kqueue. |
| [`logvec`](https://github.com/kroq86/fasm-mac/blob/main/docs/logvec.md) | Hybrid FASM/Zig path: FASM отвечает за vector math, Zig - за index I/O и orchestration. |
| [`macdbg`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/macdbg.asm) | Advanced/experimental: AI-native LLDB snapshot debugger с native UI. |

## Release Discipline

Главный продуктовый урок не в том, что "assembly запускается". Важно, что
assembly-проекты могут поставляться как обычные developer tools.

В `fasm-mac` это видно по структуре:

- focused `scripts/check_*.sh` gates для apps и core behavior;
- `Formula/*.rb` Homebrew packaging для finished tools;
- release builders вида `scripts/build-*-release.sh`;
- apps используют reusable core helpers, а не прячут private frameworks внутри
  каждого продукта.

Поэтому `fasm-mac` - практическая лаборатория для этого handbook: здесь
объясняются концепции, а companion repo показывает, как эти концепции становятся
инструментами, которые можно установить.
