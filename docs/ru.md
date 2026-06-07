---
title: Русский Обзор
permalink: /ru/
---

# Репозиторий с примерами и единой книгой CPU + FASM

Здесь собраны примеры на Flat Assembler, обёртки на Python и C, а также единая книга для x86_64 Linux.

## Нативный FASM для macOS

Этот репозиторий в первую очередь про Linux/ELF64. Для нативной работы на macOS
есть companion-проект [fasm-mac](https://github.com/kroq86/fasm-mac): macOS
x86_64 порт FASM с Mach-O output, macOS syscall include-файлами,
kqueue/green-thread networking и готовыми утилитами вроде `httpmini`, `macdbg`,
`machodoctor`, `logknife`, `fscan`, `pathsum` и `miniredis_server`.

## Главная книга

- [Единая книга (CPU + FASM, 12 глав)]({{ '/book-ru/' | relative_url }})
- В книге есть главы про процессор, ассемблер, интерпретатор, сопрограммы и практику.

## Что внутри

### Базовые примеры

- `mycat.asm` для чтения файлов.
- `arg.asm` для разбора аргументов командной строки.
- `fib.asm` для генерации чисел Фибоначчи.
- `two_sum.asm` как алгоритмический пример.
- `file_ops.asm` для системной работы с файлами.

### Более сложные разделы

- `add/` с интеграцией FASM, Python и C.
- `binary_search/` с реализацией бинарного поиска.
- `coroutines/` с переключением контекста.
- `vec/` с векторными операциями.
- `hex_editor/` как прикладная утилита.

## Остальная документация

- [English handbook]({{ '/book-en/' | relative_url }})
- [Каталог примеров]({{ '/examples/' | relative_url }})
- [Карта репозитория]({{ '/repository-map/' | relative_url }})
- [Полный Reference Guide]({{ '/reference-guide/' | relative_url }})
- [AI FASM Rules]({{ '/ai-fasm-rules/' | relative_url }}) с правилами генерации кода под этот репозиторий.

## Какая языковая схема лучше

Для GitHub Pages лучше оставить английский основным входом, а русский держать как полноценную параллельную версию:

- Английский даёт лучшую видимость на GitHub.
- Русский удобнее для локального объяснения и обучения.
- Две версии не конфликтуют, если README остаётся коротким, а книга живёт на Pages.

## Быстрый старт

```bash
fasm fib.asm
chmod +x fib
./fib
```

## Рекомендуемые GitHub topics

`fasm`, `flat-assembler`, `assembly`, `x86-64`, `linux`, `elf64`, `macos`, `mach-o`, `systems-programming`, `low-level-programming`, `algorithms`, `simd`
