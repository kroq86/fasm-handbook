---
title: Книга RU
permalink: /book-ru/
---

# Справочник по FASM

Эта страница превращает текущий reference guide в формат книги для GitHub Pages.

## Полные главы

- [Полный Reference Guide]({{ '/reference-guide/' | relative_url }})
- [AI FASM Rules]({{ '/ai-fasm-rules/' | relative_url }})

## 1. Структура программы

```nasm
format ELF64 executable
entry main
```

- Для Linux-исполняемых файлов используется `format ELF64 executable`.
- Сегменты лучше держать явными и предсказуемыми.

```nasm
segment readable writeable
segment readable executable
```

## 2. Системные вызовы

```nasm
SYS_read  equ 0
SYS_write equ 1
SYS_close equ 3
SYS_exit  equ 60
```

- В `RAX` находится номер системного вызова.
- Аргументы идут через `RDI`, `RSI`, `RDX`, `R10`, `R8`, `R9`.

## 3. Работа с файлами

```nasm
mov rax, 2
mov rdi, filename
mov rsi, 0
syscall
```

- Возврат системного вызова нужно проверять сразу.
- Отрицательное значение означает ошибку.

## 4. Данные и память

```nasm
file_handle dq 0
filename db 'lol.txt', 0
buffer_size equ 1024
buffer rb buffer_size
```

- Сначала константы.
- Строки лучше держать с нулевым терминатором.
- Буферы резервируются явно через `rb`, `rw`, `rd`, `rq`.

## 5. Вспомогательные макросы

```nasm
macro funcall1 func, a
{
    mov rdi, a
    call func
}
```

- Макросы убирают повторяющийся код.
- Но соглашение по регистрам всё равно нужно соблюдать вручную.

## 6. Соглашение по регистрам

- `RAX` используется для системных вызовов и возвращаемых значений.
- `RDI`, `RSI`, `RDX`, `RCX` часто несут параметры.
- `RAX`, `RCX`, `RDX`, `R8`-`R11` считаются volatile.

## 7. Обработка ошибок

```nasm
syscall
test rax, rax
js error_handler
```

- После каждого потенциально ошибочного syscall лучше делать проверку.
- Освобождение ресурсов удобнее держать в одном обработчике ошибок.

## 8. Типовой шаблон: цикл чтения

```nasm
read_loop:
    mov rax, SYS_read
    mov rdi, [file_handle]
    mov rsi, buffer
    mov rdx, buffer_size
    syscall
```

- Это базовый шаблон из `mycat.asm`.
- После него обычно идут проверка `EOF` и ветка ошибок.

## 9. Печать чисел

В репозитории есть компактные приёмы преобразования чисел в ASCII, особенно в `fib.asm`.

## 10. Заметки по оптимизации

- По возможности держать значения в регистрах.
- Перед `call` сохранять выравнивание стека в 16 байт.
- Для быстрых проверок удобно использовать флаги, например `test rax, rax`.

## 11. Отладка

- Для точек останова можно вставлять `int3`.
- `readelf -h <binary>` помогает быстро проверить ELF-заголовок и entry point.
- Для GDB можно использовать графический frontend `gf`.

## 12. Связанные страницы

- [Русский обзор]({{ '/ru/' | relative_url }})
- [English handbook]({{ '/book-en/' | relative_url }})
- [Полный Reference Guide]({{ '/reference-guide/' | relative_url }})
- [AI FASM Rules]({{ '/ai-fasm-rules/' | relative_url }})
