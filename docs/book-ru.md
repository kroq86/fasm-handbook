---
title: Книга RU
permalink: /book-ru/
---

# Создание компьютера с нуля
## Путешествие через вычисления, ассемблер и Lisp

*Образовательное руководство, основанное на практической реализации*

---

## Содержание

### Часть 1: Основы вычислений
- [Глава 1: Понимание работы компьютеров](#глава-1)
- [Глава 2: Основы CPU](#глава-2)
### Часть 2: Язык ассемблера - Первый шаг
- [Глава 3: Введение в ассемблер](#глава-3)
- [Глава 4: Управление потоком в ассемблере](#глава-4)
### Часть 3: Движение вверх - Концепции языков программирования
- [Глава 5: От машинного кода к языкам высокого уровня](#глава-5)
- [Глава 6: Понимание выполнения программ](#глава-6)
### Часть 4: Lisp - Красивая абстракция
- [Глава 7: Введение в Lisp](#глава-7)
- [Глава 8: Концепции функционального программирования](#глава-8)
### Часть 5: Создание интерпретатора
- [Глава 9: Основы интерпретатора](#глава-9)
- [Глава 10: Продвинутые возможности интерпретатора](#глава-10)
### Часть 6: Продвинутые концепции
- [Глава 11: Сопрограммы и современное программирование](#глава-11)
- [Глава 12: Объединяя всё вместе](#глава-12)

---

<a name="глава-1"></a>
# Глава 1: Понимание работы компьютеров

## Цели обучения
К концу этой главы вы:
- Поймете фундаментальные компоненты компьютера
- Освоите представление данных в двоичной системе
- Изучите основы машинного кода
- Поймете организацию памяти и концепции обработки

## 1.1 Базовая архитектура компьютера

В своей основе компьютер - это машина, которая обрабатывает информацию. Эта обработка происходит через взаимодействие нескольких ключевых компонентов:

### 1.1.1 Основные компоненты
1. **Центральный процессор (CPU)**
   - "Мозг" компьютера
   - Выполняет инструкции
   - Содержит регистры для временного хранения данных
   - Выполняет арифметические и логические операции

2. **Память (RAM)**
   - Временное хранилище для программ и данных
   - Организована в адресуемые ячейки
   - Прямое взаимодействие с CPU
   - Энергозависимая память (очищается при выключении)

3. **Ввод/Вывод (I/O)**
   - Взаимодействие с внешним миром
   - Обработка ввода и вывода данных
   - Управление коммуникацией устройств

## 1.2 Двоичная система и представление данных

### 1.2.1 Понимание двоичной системы
Двоичная система - это фундаментальный язык компьютеров. Давайте разберем почему и как она работает:

- **Основы двоичной системы**
  - Использует только 0 и 1
  - Каждая цифра называется "бит"
  - 8 бит = 1 байт

### 1.2.2 Представление чисел
```
Десятичное: 42
Двоичное:   00101010
Шестнадцатеричное: 2A
```

### 1.2.3 Представление текста (ASCII)
```
'A' = 01000001
'B' = 01000010
'C' = 01000011
```

## 1.3 Введение в машинный код

Машинный код - это низший уровень программирования, который выполняется непосредственно процессором. Рассмотрим простой пример:

```assembly
; Представление машинного кода
10110000  ; Загрузить значение в регистр
00101010  ; Значение 42
00000001  ; Сохранить в памяти
```

## 1.4 Память и обработка

### 1.4.1 Организация памяти
- Память организована линейно
- Каждая ячейка имеет уникальный адрес
- Данные сохраняются и извлекаются с использованием этих адресов

### 1.4.2 Базовый цикл обработки
1. Получение инструкции из памяти
2. Декодирование инструкции
3. Выполнение инструкции
4. Сохранение результата
5. Повторение

## Практические упражнения

1. **Преобразование в двоичную систему**
   - Преобразуйте следующие числа в двоичную систему:
     - 15
     - 127
     - 256

2. **Адресация памяти**
   - Если у вас 8 бит для адресации, сколько уникальных ячеек памяти вы можете адресовать?
   - Сколько памяти вы можете адресовать с помощью 16 бит?

3. **Базовый машинный код**
   - Напишите двоичное представление для:
     - Загрузки значения в регистр
     - Сложения двух чисел
     - Сохранения результата в памяти

## Контрольные вопросы

1. Каковы основные компоненты компьютерной системы?
2. Как данные представляются в двоичной системе?
3. Какова связь между CPU и памятью?
4. Как работает базовый цикл инструкций?

## Дополнительное чтение
- Организация компьютера и дизайн (Patterson & Hennessy)
- Код: Скрытый язык компьютерного оборудования и программного обеспечения (Charles Petzold)

---

[Следующая глава: Основы CPU →](#глава-2)

[Продолжение следует...] 

<a name="глава-2"></a>
# Глава 2: Основы CPU

## Цели обучения
К концу этой главы вы:
- Поймете архитектуру CPU и его компоненты
- Изучите, как обрабатываются инструкции
- Реализуете базовый симулятор CPU
- Научитесь работать с регистрами и памятью

## 2.1 Углубленное изучение архитектуры CPU

### 2.1.1 Основные компоненты CPU
Рассмотрим нашу реализацию `SimpleCPU` для понимания основных компонентов:

```python
# Из нашей реализации SimpleCPU
class SimpleCPU:
    def __init__(self):
        self.registers = {'A': 0, 'PC': 0}  # Базовые регистры
        self.memory = [0] * 256             # 256 байт памяти
```

Ключевые компоненты:
1. **Регистры**
   - Счетчик программы (PC): Отслеживает текущую инструкцию
   - Аккумулятор (A): Основной регистр для вычислений
   - Почему они важны для вычислений

2. **Интерфейс памяти**
   - Прямой доступ к памяти
   - Размер памяти и ограничения
   - Взаимодействие память-регистр

## 2.2 Обработка инструкций

### 2.2.1 Набор инструкций
Из нашей реализации:
```python
# Базовый набор инструкций
instructions = {
    "NOP": 0x00,  # Нет операции
    "LDA": 0x01,  # Загрузить в аккумулятор
    "ADD": 0x02,  # Добавить к аккумулятору
    "HLT": 0xFF,  # Остановить выполнение
}
```

### 2.2.2 Цикл выполнения инструкций
```python
def execute(self):
    while True:
        if self.registers['PC'] >= len(self.memory):
            break  
        opcode = self.memory[self.registers['PC']]
        # Обработка инструкции...
```

## 2.3 Создание симулятора CPU

### 2.3.1 Этапы реализации
1. **Настройка окружения**
   - Инициализация регистров
   - Выделение памяти
   - Определение базового набора инструкций

2. **Реализация инструкций**
   ```python
   # Пример реализации инструкции
   elif opcode == 0x01:  # LDA immediate
       self.registers['A'] = self.memory[self.registers['PC'] + 1]
       self.registers['PC'] += 2
   ```

3. **Выполнение программы**
   - Цикл получение-декодирование-выполнение
   - Управление счетчиком программы
   - Обработка различных типов инструкций

## 2.4 Работа с ассемблерным кодом

### 2.4.1 Преобразование ассемблера в машинный код
```python
def assemble(self, assembly_code):
    instructions = {
        "NOP": 0x00,
        "LDA": 0x01,
        "ADD": 0x02,
        "HLT": 0xFF,
    }
    # Процесс ассемблирования...
```

### 2.4.2 Запуск программ
Пример программы:
```assembly
LDA #5    ; Загрузить 5 в аккумулятор
ADD #3    ; Добавить 3 к аккумулятору
HLT       ; Остановить выполнение
```

## Практические упражнения

1. **Улучшение симулятора CPU**
   - Добавьте инструкцию вычитания
   - Реализуйте инструкцию умножения
   - Добавьте новый регистр для временного хранения

2. **Программирование на ассемблере**
   - Напишите программу для сложения трех чисел
   - Создайте программу, которая считает от 1 до 10
   - Реализуйте простой цикл, используя новые инструкции

3. **Практика отладки**
   - Найдите ошибку в этом ассемблерном коде:
     ```assembly
     LDA #5
     ADD #3
     ADD #2
     ; Отсутствует инструкция HLT
     ```

## Контрольные вопросы

1. Каковы основные компоненты нашего SimpleCPU?
2. Как работает цикл выполнения инструкций?
3. Почему нам нужны разные типы регистров?
4. Как ассемблерный код преобразуется в машинный код?

## Задачи программирования

1. Расширьте SimpleCPU, добавив:
   - Больше регистров
   - Дополнительные инструкции
   - Условное ветвление

2. Создайте программу, которая:
   - Вычисляет числа Фибоначчи
   - Реализует базовую арифметику
   - Эффективно использует несколько регистров

## Дополнительное чтение
- Архитектура компьютера: Количественный подход
- Внутри машины (Jon Stokes)
- Элементы вычислительных систем (Nisan & Schocken)

---

[← Предыдущая глава](#глава-1) | [Следующая глава: Введение в ассемблер →](#глава-3) 

<a name="глава-3"></a>
# Глава 3: Введение в ассемблер

## Цели обучения
К концу этой главы вы:
- Поймете основы ассемблера x86_64
- Напишете свои первые программы на ассемблере
- Изучите системные вызовы и ввод/вывод
- Реализуете математические алгоритмы на ассемблере

## 3.1 Понимание ассемблера x86_64

### 3.1.1 Базовая структура
Рассмотрим нашу реализацию чисел Фибоначчи на ассемблере:

```nasm
format ELF64 executable   ; Указание формата вывода
entry main               ; Точка входа в программу

; Определения системных вызовов
SYS_write equ 1         ; Номер системного вызова write
STDOUT equ 1            ; Файловый дескриптор стандартного вывода
```

### 3.1.2 Регистры и их назначение
Общие регистры в x86_64:
- `rax`: Аккумулятор, номера системных вызовов
- `rdi`, `rsi`, `rdx`: Параметры функций/системных вызовов
- `r8`-`r15`: Регистры общего назначения

Из нашей реализации:
```nasm
mov     r10, a          ; Сохранить первое число
mov     r11, b          ; Сохранить второе число
mov     r12, 1          ; Счетчик
```

## 3.2 Системные вызовы и ввод/вывод

### 3.2.1 Выполнение системных вызовов
Наша реализация показывает чистую обработку системных вызовов:

```nasm
macro syscall3 number, a, b, c
{
    mov rax, number
    mov rdi, a
    mov rsi, b
    mov rdx, c
    syscall
}
```

### 3.2.2 Операции ввода/вывода
Пример из нашей функции печати:
```nasm
print:
    mov     r9, -3689348814741910323
    sub     rsp, 40
    mov     BYTE [rsp+31], 10
    lea     rcx, [rsp+30]
```

## 3.3 Реализация алгоритмов

### 3.3.1 Последовательность Фибоначчи
Разберем нашу реализацию:

```nasm
macro fib a, b {
    mov r10, a         ; Первое число
    mov r11, b         ; Второе число
    mov r12, 1         ; Счетчик

_loop:
    add r10, r11       ; Вычислить следующее число
    mov r11, r10       ; Обновить последовательность
    mov r10, r12       ; Обновить счетчик
    inc r12
    cmp r12, 5
    jle _loop
}
```

Ключевые концепции:
1. Реализация цикла
2. Управление регистрами
3. Арифметические операции
4. Условное ветвление

### 3.3.2 Операции с памятью и стеком
```nasm
sub     rsp, 40        ; Выделить место в стеке
mov     BYTE [rsp+31], 10  ; Сохранить перевод строки
lea     rcx, [rsp+30]  ; Загрузить эффективный адрес
```

## 3.4 Управляющие конструкции

### 3.4.1 Циклы
Из нашей реализации:
```nasm
loop_start:
    syscall3 SYS_write, STDOUT, greet_msg, greet_msg_len
    inc r8
    cmp r8, 10
    jle loop_start
```

### 3.4.2 Условное выполнение
```nasm
    cmp r12, 5         ; Сравнить счетчик с 5
    jle _loop          ; Перейти, если меньше или равно
```

## Практические упражнения

1. **Базовый ассемблер**
   - Напишите программу для сложения двух чисел
   - Реализуйте программу-счетчик
   - Создайте простой цикл

2. **Системные вызовы**
   - Напишите программу, которая выводит "Привет, мир!"
   - Считайте пользовательский ввод и выведите его обратно
   - Реализуйте операции с файлами

3. **Реализация алгоритмов**
   - Напишите программу для вычисления факториала
   - Реализуйте простой алгоритм сортировки
   - Создайте игру угадывания чисел

## Задачи программирования

1. **Расширенный Фибоначчи**
   - Измените программу Фибоначчи, чтобы:
     - Обрабатывать большие числа
     - Печатать последовательность
     - Позволять пользователю задавать длину последовательности

2. **Математические операции**
   - Реализуйте деление
   - Добавьте операции с плавающей точкой
   - Создайте простой калькулятор

## Контрольные вопросы

1. Каковы основные регистры в ассемблере x86_64?
2. Как работают системные вызовы в ассемблере?
3. Какова цель стека?
4. Как реализуются циклы и условия?

## Советы по отладке

1. **Распространенные проблемы**
   - Отслеживание значений регистров
   - Выравнивание стека
   - Параметры системных вызовов

2. **Инструменты отладки**
   - Использование GDB
   - Проверка стека
   - Исследование состояния регистров

## Дополнительное чтение
- Профессиональное программирование на ассемблере (Richard Blum)
- Современное программирование на ассемблере x86 (Daniel Kusswurm)
- Системное программирование в Linux (Robert Love)

## Подсказки к решениям упражнений главы 3

### Решения для базового ассемблера
1. **Сложение двух чисел**:
```nasm
section .data
    num1 db 5
    num2 db 3
    
section .text
    mov al, [num1]    ; Загрузить первое число
    add al, [num2]    ; Добавить второе число
    ; Результат в al
```

2. **Программа-счетчик**:
```nasm
    mov rcx, 0       ; Инициализировать счетчик
count_loop:
    inc rcx          ; Увеличить
    cmp rcx, 10      ; Сравнить с пределом
    jl count_loop    ; Цикл, если меньше
```

3. **Простой цикл с вводом/выводом**:
```nasm
    mov r8, 0        ; Счетчик
print_loop:
    ; Ваша процедура печати здесь
    inc r8
    cmp r8, 5
    jle print_loop
```

### Решения для системных вызовов
1. **Привет, мир**:
```nasm
section .data
    msg db "Привет, мир!", 10
    len equ $ - msg

section .text
    syscall3 SYS_write, STDOUT, msg, len
```

---

[← Предыдущая глава](#глава-2) | [Следующая глава: Управление потоком в ассемблере →](#глава-4) 

<a name="глава-4"></a>
# Глава 4: Управление потоком в ассемблере

## Цели обучения
К концу этой главы вы:
- Освоите сложные управляющие конструкции
- Реализуете условное выполнение
- Поймете вызовы функций и кадры стека
- Научитесь работать с циклами и ветвлением

## 4.1 Продвинутые управляющие конструкции

### 4.1.1 Условное ветвление
Из нашей реализации Фибоначчи:

```nasm
    cmp r12, 5         ; Сравнить счетчик с пределом
    jle _loop          ; Перейти, если меньше или равно
    jmp exit           ; Перейти к выходу, если больше
```

Общие инструкции сравнения:
- `je/jz`: Переход если равно/ноль
- `jne/jnz`: Переход если не равно/не ноль
- `jg/jl`: Переход если больше/меньше
- `jge/jle`: Переход если больше или равно/меньше или равно

### 4.1.2 Сложное принятие решений
```nasm
    cmp rax, 0
    je  handle_zero    ; Если ноль
    jl  handle_negative ; Если отрицательное
    ; Обработка положительного случая
handle_zero:
    ; Код обработки нуля
handle_negative:
    ; Код обработки отрицательного числа
```

## 4.2 Реализация функций

### 4.2.1 Управление кадром стека
```nasm
my_function:
    push rbp           ; Сохранить старый указатель базы
    mov rbp, rsp       ; Установить новый указатель базы
    sub rsp, 16        ; Выделить локальные переменные
    
    ; Тело функции
    
    mov rsp, rbp       ; Восстановить стек
    pop rbp            ; Восстановить указатель базы
    ret                ; Вернуться к вызывающему
```

### 4.2.2 Передача параметров
Соглашение о вызовах Linux x86_64:
```nasm
; Порядок параметров функции:
; rdi, rsi, rdx, rcx, r8, r9
; Дополнительные параметры в стеке

call_example:
    mov rdi, first_param
    mov rsi, second_param
    call my_function
```

## 4.3 Оптимизация циклов

### 4.3.1 Развертывание циклов
```nasm
; До развертывания
    mov rcx, 4
loop1:
    add rax, [rdi]
    add rdi, 8
    dec rcx
    jnz loop1

; После развертывания
    add rax, [rdi]
    add rax, [rdi+8]
    add rax, [rdi+16]
    add rax, [rdi+24]
```

### 4.3.2 Условия циклов
Из нашей реализации:
```nasm
_loop:
    add r10, r11       ; Основная операция
    mov rdi, r11       ; Подготовка к печати
    call print         ; Печать числа
    
    mov r11, r10       ; Обновить последовательность
    inc r12            ; Увеличить счетчик
    cmp r12, 5         ; Проверить условие
    jle _loop          ; Продолжить если нужно
```

## 4.4 Обработка ошибок

### 4.4.1 Проверка ошибок
```nasm
    ; Проверка деления на ноль
    cmp rdx, 0
    je error_handler
    
    ; Проверка переполнения
    jo overflow_handler
    
error_handler:
    mov rdi, error_msg
    call print_error
    ret
```

### 4.4.2 Обработка ошибок системных вызовов
```nasm
    syscall
    cmp rax, 0
    jl handle_error    ; Отрицательный возврат = ошибка
```

## Практические упражнения

1. **Реализация управления потоком**
   - Создайте структуру switch-case
   - Реализуйте вложенные условия if-else
   - Постройте конечный автомат

2. **Упражнения с функциями**
   - Напишите рекурсивную функцию
   - Реализуйте функцию с локальными переменными
   - Создайте функцию, использующую несколько параметров

3. **Продвинутые циклы**
   - Реализуйте структуру вложенных циклов
   - Создайте оптимизированный цикл подсчета
   - Постройте цикл с несколькими условиями выхода

## Задачи программирования

1. **Конечный автомат**
   - Реализуйте простой калькулятор
   - Создайте парсер текста
   - Постройте простой игровой цикл

2. **Продвинутые функции**
   - Рекурсивный Фибоначчи с управлением стеком
   - Реализация таблицы указателей на функции
   - Система обработки исключений

## Контрольные вопросы

1. Как реализовать сложную логику ветвления?
2. Какова цель управления кадром стека?
3. Как оптимизировать циклы в ассемблере?
4. Каковы лучшие практики обработки ошибок?

## Советы по отладке

1. **Отладка управления потоком**
   - Эффективное использование точек останова
   - Отслеживание состояний регистров
   - Мониторинг изменений стека

2. **Распространенные проблемы**
   - Бесконечные циклы
   - Повреждение стека
   - Неправильные условия перехода

## Дополнительное чтение
- Низкоуровневое программирование (Igor Zhirkov)
- Ассемблер шаг за шагом (Jeff Duntemann)
- Продвинутое программирование на x86 (Ray Seyfarth)

## Подсказки к решениям упражнений главы 4

### Решения для управления потоком
1. **Структура switch-case**:
```nasm
section .data
    jump_table: dq case_0, case_1, case_2, case_3
    
section .text
    ; Предполагаем значение в rax
    cmp rax, 3          ; Проверка границ
    ja default_case
    jmp [jump_table + rax * 8]
    
case_0:
    ; Обработка случая 0
    jmp end_switch
case_1:
    ; Обработка случая 1
    jmp end_switch
case_2:
    ; Обработка случая 2
    jmp end_switch
case_3:
    ; Обработка случая 3
    jmp end_switch
default_case:
    ; Обработка по умолчанию
end_switch:
```

2. **Вложенные if-else**:
```nasm
    cmp rax, 10
    jg greater_than_10
    je equals_10
    ; Случай меньше 10
    jmp end_if
greater_than_10:
    cmp rax, 20
    jg greater_than_20
    ; Между 10 и 20
    jmp end_if
greater_than_20:
    ; Больше 20
end_if:
```

### Решения для реализации функций
1. **Рекурсивный Фибоначчи**:
```nasm
fib:
    push rbp
    mov rbp, rsp
    
    cmp rdi, 2        ; n <= 2?
    jle base_case
    
    ; n-1
    dec rdi
    call fib
    mov rbx, rax      ; Сохранить fib(n-1)
    
    ; n-2
    dec rdi
    call fib
    add rax, rbx      ; fib(n-1) + fib(n-2)
    
    jmp fib_end
base_case:
    mov rax, 1
fib_end:
    mov rsp, rbp
    pop rbp
    ret
```

### Сценарии продвинутой отладки

1. **Отладка повреждения стека**:
```nasm
; Проблема: Несбалансированный стек
bad_function:
    push rbx
    push r12
    ; ... код ...
    pop rbx      ; Упс! Неправильный порядок
    pop r12
    ret

; Решение: Поддерживать порядок стека
good_function:
    push rbx
    push r12
    ; ... код ...
    pop r12      ; Правильный порядок
    pop rbx
    ret
```

2. **Сохранение регистров**:
```nasm
; Проблема: Значения регистров потеряны
bad_code:
    mov rax, [data]
    call helper     ; helper изменяет rax
    add rax, 5      ; Неправильный результат!

; Решение: Сохранять регистры
good_code:
    mov rax, [data]
    push rax
    call helper
    pop rax
    add rax, 5
```

## Дополнительные методы оптимизации

### 4.5 Продвинутая оптимизация

#### 4.5.1 Оптимизация использования регистров
```nasm
; Плохое использование регистров
mov rax, [data]
mov rbx, rax
add rbx, 5
mov [result], rbx

; Оптимизированная версия
mov rax, [data]
add rax, 5
mov [result], rax
```

#### 4.5.2 Оптимизация доступа к памяти
```nasm
; Плохой доступ к памяти
mov al, [array]
inc al
mov [array], al
mov al, [array]
add al, 5
mov [array], al

; Оптимизированная версия
mov al, [array]
inc al
add al, 5
mov [array], al
```

#### 4.5.3 Подсказки для предсказания переходов
```nasm
; Подсказка вероятного пути
    cmp rax, 0
    jg likely_positive   ; Процессор ожидает этот путь
    ; Обработка отрицательного случая
likely_positive:
    ; Обработка положительного случая
```

---

[← Предыдущая глава](#глава-3) | [Следующая глава: От машинного кода к языкам высокого уровня →](#глава-5)

<a name="глава-5"></a>
# Глава 5: От машинного кода к языкам высокого уровня

## Цели обучения
К концу этой главы вы:
- Поймете переход от ассемблера к языкам высокого уровня
- Изучите уровни абстракции языков
- Исследуете компиляцию и интерпретацию
- Реализуете базовые возможности языка

## 5.1 Эволюция языков программирования

### 5.1.1 От машинного кода к ассемблеру
```nasm
; Машинный код
10110000 00000101   ; Загрузить 5
00000011 00000011   ; Добавить 3

; Эквивалент на ассемблере
mov al, 5
add al, 3
```

### 5.1.2 От ассемблера к конструкциям высокого уровня
```python
# Эквивалент на языке высокого уровня
x = 5
x += 3

# Наша реализация SimpleCPU
def execute(self):
    while True:
        opcode = self.memory[self.registers['PC']]
        if opcode == 0x01:  # LDA
            self.registers['A'] = self.memory[self.registers['PC'] + 1]
```

## 5.2 Уровни абстракции языка

### 5.2.1 Управление памятью
Низкий уровень:
```nasm
section .data
    buffer: resb 1024
section .text
    mov rdi, buffer
    mov rcx, 1024
    call allocate
```

Высокий уровень:
```python
buffer = bytearray(1024)
```

### 5.2.2 Управляющие конструкции
Ассемблер vs Высокий уровень:
```nasm
; Цикл на ассемблере
    mov rcx, 0
loop_start:
    ; Тело цикла
    inc rcx
    cmp rcx, 10
    jl loop_start
```

```python
# Эквивалент на Python
for i in range(10):
    # Тело цикла
```

## 5.3 Создание возможностей языка

### 5.3.1 Переменные и типы
```python
class Variable:
    def __init__(self, name, type, value):
        self.name = name
        self.type = type
        self.value = value
        
class Environment:
    def __init__(self):
        self.variables = {}
        
    def define(self, name, type, value):
        self.variables[name] = Variable(name, type, value)
```

### 5.3.2 Функции и процедуры
```python
class Function:
    def __init__(self, params, body, env):
        self.params = params
        self.body = body
        self.env = env
        
    def call(self, args):
        local_env = Environment()
        for param, arg in zip(self.params, args):
            local_env.define(param.name, param.type, arg)
        return evaluate(self.body, local_env)
```

## Практические упражнения

1. **Реализация возможностей языка**
   - Реализуйте простую систему типов
   - Создайте базовый механизм области видимости переменных
   - Постройте систему вызова функций

2. **Перевод управляющих конструкций**
   - Преобразуйте циклы ассемблера в конструкции высокого уровня
   - Реализуйте операторы if-else
   - Создайте базовую систему обработки исключений

3. **Управление памятью**
   - Реализуйте простой сборщик мусора
   - Создайте систему выделения памяти
   - Постройте механизм подсчета ссылок

## Контрольные вопросы

1. Как языки высокого уровня абстрагируют машинные операции?
2. Каковы компромиссы между ассемблером и языками высокого уровня?
3. Как работает реализация системы типов?
4. Какую роль играет управление памятью в дизайне языка?

## Дополнительное чтение
- Прагматика языков программирования (Michael Scott)
- Создание интерпретаторов (Robert Nystrom)
- Типы и языки программирования (Benjamin Pierce)

## Подсказки к решениям упражнений главы 5

### Решения для реализации возможностей языка
1. **Простая система типов**:
```python
class Type:
    def __init__(self, name, size):
        self.name = name
        self.size = size  # Размер в байтах

# Базовые типы
INTEGER = Type("int", 4)
FLOAT = Type("float", 8)
CHAR = Type("char", 1)

class TypeChecker:
    def check_operation(self, op, left_type, right_type):
        if op in ['+', '-', '*', '/']:
            if left_type == INTEGER and right_type == INTEGER:
                return INTEGER
            elif left_type == FLOAT or right_type == FLOAT:
                return FLOAT
        raise TypeError(f"Недопустимая операция {op} между {left_type.name} и {right_type.name}")
```

2. **Механизм области видимости переменных**:
```python
class Scope:
    def __init__(self, parent=None):
        self.symbols = {}
        self.parent = parent
    
    def define(self, name, value):
        self.symbols[name] = value
    
    def resolve(self, name):
        if name in self.symbols:
            return self.symbols[name]
        if self.parent:
            return self.parent.resolve(name)
        raise NameError(f"Имя '{name}' не определено")

# Пример использования
global_scope = Scope()
function_scope = Scope(global_scope)
block_scope = Scope(function_scope)
```

3. **Система вызова функций**:
```python
class CallFrame:
    def __init__(self, function, return_addr):
        self.local_vars = {}
        self.function = function
        self.return_addr = return_addr

class VirtualMachine:
    def __init__(self):
        self.call_stack = []
        self.current_frame = None
    
    def call_function(self, func, args):
        frame = CallFrame(func, self.instruction_pointer)
        self.call_stack.append(frame)
        self.current_frame = frame
        
        # Настройка параметров
        for param, arg in zip(func.params, args):
            frame.local_vars[param] = arg
            
        # Выполнение тела функции
        result = self.execute(func.body)
        
        # Восстановление предыдущего кадра
        self.call_stack.pop()
        self.current_frame = self.call_stack[-1] if self.call_stack else None
        return result
```

### Дополнительные сравнения языков

1. **Условные операторы**:
```nasm
; If-else на ассемблере
    cmp eax, 0
    jle is_negative
    ; код для положительного случая
    jmp end_if
is_negative:
    ; код для отрицательного случая
end_if:
```

```python
# Эквивалент на Python
if x > 0:
    # код для положительного случая
else:
    # код для отрицательного случая
```

2. **Вызовы функций**:
```nasm
; Функция на ассемблере
calculate:
    push rbp
    mov rbp, rsp
    ; тело функции
    mov rsp, rbp
    pop rbp
    ret

; Место вызова
    call calculate
```

```python
# Эквивалент на Python
def calculate():
    # тело функции
    return result

# Место вызова
result = calculate()
```

3. **Операции с массивами**:
```nasm
; Доступ к массиву на ассемблере
    mov rax, [array + rdi * 8]  ; array[i]
```

```python
# Эквивалент на Python
value = array[i]
```

---

[← Предыдущая глава](#глава-4) | [Следующая глава: Понимание выполнения программ →](#глава-6)

<a name="глава-6"></a>
# Глава 6: Понимание выполнения программ

## Цели обучения
К концу этой главы вы:
- Поймете, как программы загружаются и выполняются
- Изучите организацию памяти и управление ею
- Освоите концепции процессов и потоков
- Реализуете базовые системы времени выполнения

## 6.1 Загрузка и выполнение программ

### 6.1.1 Процесс загрузки
```python
class ProgramLoader:
    def __init__(self):
        self.memory = bytearray(1024 * 1024)  # 1MB памяти
        self.segments = {
            'text': 0x0000,
            'data': 0x4000,
            'heap': 0x8000,
            'stack': 0xF000
        }
    
    def load_program(self, code, data):
        # Загрузка сегмента кода
        self.load_segment(code, self.segments['text'])
        # Загрузка сегмента данных
        self.load_segment(data, self.segments['data'])
        # Инициализация указателя стека
        self.registers['rsp'] = self.segments['stack']
```

### 6.1.2 Организация памяти
```
Высокий адрес  +------------------+
               |      Стек        |
               |        ↓         |
               |                  |
               |        ↑         |
               |      Куча        |
               |                  |
               |    Данные (BSS)  |
               |    Данные (Data) |
               |    Текст (Код)   |
Низкий адрес   +------------------+
```

## 6.2 Управление памятью времени выполнения

### 6.2.1 Управление стеком
```python
class StackFrame:
    def __init__(self, return_addr, base_ptr):
        self.local_vars = {}
        self.saved_registers = {}
        self.return_addr = return_addr
        self.base_ptr = base_ptr

class Stack:
    def __init__(self, size=1024*1024):
        self.memory = bytearray(size)
        self.sp = size  # Стек растет вниз
        
    def push(self, value):
        self.sp -= 8  # 64-бит
        struct.pack_into('Q', self.memory, self.sp, value)
        
    def pop(self):
        value = struct.unpack_from('Q', self.memory, self.sp)[0]
        self.sp += 8
        return value
```

### 6.2.2 Управление кучей
```python
class HeapManager:
    def __init__(self, start_addr, size):
        self.start = start_addr
        self.size = size
        self.blocks = [(start_addr, size, False)]  # (адрес, размер, используется)
    
    def allocate(self, size):
        # Алгоритм первого подходящего
        for i, (addr, block_size, used) in enumerate(self.blocks):
            if not used and block_size >= size:
                self.blocks[i] = (addr, size, True)
                if block_size > size:
                    # Разделить блок
                    self.blocks.insert(i + 1, 
                        (addr + size, block_size - size, False))
                return addr
        return None  # Нет свободной памяти
```

## 6.3 Управление процессами и потоками

### 6.3.1 Блок управления процессом
```python
class ProcessControlBlock:
    def __init__(self, pid):
        self.pid = pid
        self.state = 'NEW'  # NEW, READY, RUNNING, WAITING, TERMINATED
        self.registers = {
            'rax': 0, 'rbx': 0, 'rcx': 0, 'rdx': 0,
            'rsp': 0, 'rbp': 0, 'rip': 0
        }
        self.memory_segments = {
            'text': None,
            'data': None,
            'heap': None,
            'stack': None
        }
```

### 6.3.2 Реализация потоков
```python
class Thread:
    def __init__(self, tid, entry_point):
        self.tid = tid
        self.state = 'NEW'
        self.stack = Stack()
        self.registers = {
            'rip': entry_point,
            'rsp': self.stack.sp
        }
        self.context = None
    
    def save_context(self):
        self.context = self.registers.copy()
    
    def restore_context(self):
        self.registers = self.context.copy()
```

## 6.4 Системные вызовы и прерывания

### 6.4.1 Реализация системных вызовов
```python
class SystemCallHandler:
    def __init__(self):
        self.handlers = {
            1: self.sys_write,
            2: self.sys_read,
            3: self.sys_open,
            4: self.sys_close
        }
    
    def handle_syscall(self, number, *args):
        if number in self.handlers:
            return self.handlers[number](*args)
        raise Exception(f"Недопустимый системный вызов {number}")
    
    def sys_write(self, fd, buffer, size):
        # Реализация
        pass
```

### 6.4.2 Обработка прерываний
```python
class InterruptHandler:
    def __init__(self):
        self.interrupt_vector = [None] * 256
        self.setup_handlers()
    
    def setup_handlers(self):
        self.interrupt_vector[0x80] = self.syscall_handler
        self.interrupt_vector[0x0E] = self.page_fault_handler
        
    def handle_interrupt(self, number, error_code=None):
        handler = self.interrupt_vector[number]
        if handler:
            return handler(error_code)
        raise Exception(f"Необработанное прерывание {number}")
```

## Практические упражнения

1. **Реализация управления памятью**
   - Реализуйте простой распределитель памяти
   - Создайте сборщик мусора
   - Постройте систему подсчета ссылок

2. **Управление процессами**
   - Реализуйте базовый планировщик
   - Создайте механизм создания процессов
   - Постройте систему межпроцессного взаимодействия

3. **Реализация системных вызовов**
   - Создайте системные вызовы для файловой системы
   - Реализуйте вызовы управления процессами
   - Постройте вызовы управления памятью

## Контрольные вопросы

1. Как работает загрузка программ?
2. Для чего используются различные сегменты памяти?
3. Как системные вызовы переключаются между пользовательским и режимом ядра?
4. Какова роль блока управления процессом?

## Дополнительное чтение
- Операционные системы: Три простых части
- Разработка ядра Linux (Robert Love)
- Продвинутое программирование в среде UNIX

## Подсказки к решениям упражнений главы 6

### Решения для управления памятью
1. **Простой распределитель памяти**:
```python
class MemoryBlock:
    def __init__(self, start, size):
        self.start = start
        self.size = size
        self.is_free = True
        self.next = None

class Allocator:
    def __init__(self, memory_size):
        self.memory = bytearray(memory_size)
        self.head = MemoryBlock(0, memory_size)
    
    def allocate(self, size):
        current = self.head
        while current:
            if current.is_free and current.size >= size:
                if current.size > size + 16:  # Разделить если достаточно места
                    new_block = MemoryBlock(current.start + size, 
                                          current.size - size)
                    new_block.next = current.next
                    current.size = size
                    current.next = new_block
                current.is_free = False
                return current.start
            current = current.next
        return None  # Нет свободной памяти
```

2. **Подсчет ссылок для сборки мусора**:
```python
class Object:
    def __init__(self):
        self.ref_count = 0
        self.references = []
    
    def inc_ref(self):
        self.ref_count += 1
    
    def dec_ref(self):
        self.ref_count -= 1
        if self.ref_count == 0:
            self.cleanup()
    
    def cleanup(self):
        for ref in self.references:
            ref.dec_ref()
        # Освободить память
```

### Решения для управления процессами
1. **Базовый планировщик**:
```python
class Scheduler:
    def __init__(self):
        self.ready_queue = []
        self.current_process = None
        self.quantum = 100  # Квант времени
    
    def schedule(self):
        if self.current_process:
            self.current_process.save_state()
            self.ready_queue.append(self.current_process)
        
        if self.ready_queue:
            self.current_process = self.ready_queue.pop(0)
            self.current_process.restore_state()
            self.current_process.run(self.quantum)
```

---

[← Предыдущая глава](#глава-5) | [Следующая глава: Введение в Lisp →](#глава-7)

<a name="глава-7"></a>
# Глава 7: Введение в Lisp

## Цели обучения
К концу этой главы вы:
- Поймете фундаментальные концепции Lisp
- Реализуете основные возможности Lisp
- Освоите принципы функционального программирования
- Построите интерпретатор Lisp

## 7.1 Понимание красоты Lisp

### 7.1.1 Код как данные
```lisp
; В Lisp код является данными
(define factorial
  (lambda (n)
    (if (<= n 1)
        1
        (* n (factorial (- n 1))))))

; Наша реализация на Python
def parse_lisp(code):
    def tokenize(code):
        return code.replace('(', ' ( ').replace(')', ' ) ').split()
    
    def read_from_tokens(tokens):
        if not tokens:
            raise SyntaxError("Неожиданный конец файла")
        token = tokens.pop(0)
        if token == '(':
            L = []
            while tokens[0] != ')':
                L.append(read_from_tokens(tokens))
            tokens.pop(0)  # Удалить ')'
            return L
        elif token == ')':
            raise SyntaxError("Неожиданная )")
        else:
            return atom(token)
```

### 7.1.2 Сила S-выражений
```python
class Expression:
    def __init__(self, operator, operands):
        self.operator = operator
        self.operands = operands
    
    def evaluate(self, env):
        fn = env.lookup(self.operator)
        args = [operand.evaluate(env) for operand in self.operands]
        return fn(*args)
```

## 7.2 Основные возможности Lisp

### 7.2.1 Лямбда-функции
```lisp
; Лямбда в Lisp
(lambda (x y) (+ x y))

; Наша реализация
class Lambda:
    def __init__(self, params, body, env):
        self.params = params
        self.body = body
        self.env = env
    
    def __call__(self, *args):
        local_env = Environment(self.env)
        for param, arg in zip(self.params, args):
            local_env.define(param, arg)
        return self.body.evaluate(local_env)
```

### 7.2.2 Обработка списков
```python
class Cons:
    def __init__(self, car, cdr):
        self.car = car
        self.cdr = cdr

def car(cons):
    return cons.car

def cdr(cons):
    return cons.cdr

def list_(*args):
    result = None
    for arg in reversed(args):
        result = Cons(arg, result)
    return result
```

## 7.3 Создание интерпретатора

### 7.3.1 Цикл вычисления
```python
def eval(expr, env):
    if isinstance(expr, str):              # Ссылка на переменную
        return env.lookup(expr)
    elif not isinstance(expr, list):       # Константа
        return expr
    elif expr[0] == 'quote':              # Цитирование
        return expr[1]
    elif expr[0] == 'if':                 # Условие
        (_, test, conseq, alt) = expr
        return eval(conseq, env) if eval(test, env) else eval(alt, env)
    elif expr[0] == 'define':             # Определение
        (_, var, exp) = expr
        env.define(var, eval(exp, env))
    elif expr[0] == 'lambda':             # Процедура
        (_, params, body) = expr
        return Lambda(params, body, env)
    else:                                 # Вызов процедуры
        proc = eval(expr[0], env)
        args = [eval(arg, env) for arg in expr[1:]]
        return proc(*args)
```

### 7.3.2 Окружение
```python
class Environment:
    def __init__(self, parent=None):
        self.bindings = {}
        self.parent = parent
    
    def lookup(self, name):
        if name in self.bindings:
            return self.bindings[name]
        if self.parent:
            return self.parent.lookup(name)
        raise NameError(f"Символ '{name}' не найден")
    
    def define(self, name, value):
        self.bindings[name] = value
```

## 7.4 Продвинутые возможности

### 7.4.1 Макросы
```python
class Macro:
    def __init__(self, transformer):
        self.transformer = transformer
    
    def expand(self, expr, env):
        expanded = self.transformer(expr)
        return eval(expanded, env)

def define_macro(name, transformer, env):
    env.define(name, Macro(transformer))
```

### 7.4.2 Оптимизация хвостовой рекурсии
```python
def eval_tco(expr, env):
    while True:
        if isinstance(expr, str):
            return env.lookup(expr)
        elif not isinstance(expr, list):
            return expr
        elif expr[0] == 'if':
            (_, test, conseq, alt) = expr
            expr = conseq if eval_tco(test, env) else alt
        elif expr[0] == 'define':
            (_, var, exp) = expr
            env.define(var, eval_tco(exp, env))
            return None
        else:
            proc = eval_tco(expr[0], env)
            args = [eval_tco(arg, env) for arg in expr[1:]]
            if isinstance(proc, Lambda):
                expr = proc.body
                env = Environment(proc.env)
                for param, arg in zip(proc.params, args):
                    env.define(param, arg)
            else:
                return proc(*args)
```

## Практические упражнения

1. **Реализация основных возможностей**
   - Реализуйте базовые арифметические операции
   - Создайте функции манипуляции списками
   - Постройте условные выражения

2. **Продвинутые возможности**
   - Реализуйте систему макросов
   - Добавьте оптимизацию хвостовой рекурсии
   - Создайте сборщик мусора

3. **Расширения языка**
   - Добавьте сопоставление с образцом
   - Реализуйте ленивые вычисления
   - Создайте систему модулей

## Контрольные вопросы

1. Что делает Lisp уникальным среди языков программирования?
2. Как Lisp обрабатывает код как данные?
3. Какова роль S-выражений?
4. Как работают макросы в Lisp?

## Дополнительное чтение
- Структура и интерпретация компьютерных программ
- On Lisp (Paul Graham)
- Let Over Lambda (Doug Hoyte)

## Подсказки к решениям упражнений главы 7

### Решения для реализации основных возможностей
1. **Базовые арифметические операции**:
```lisp
; Реализация на Lisp
(define (add x y) (+ x y))
(define (subtract x y) (- x y))
(define (multiply x y) (* x y))
(define (divide x y) (/ x y))

; Реализация на Python
class LispPrimitive:
    def __init__(self, fn):
        self.fn = fn
    def __call__(self, *args):
        return self.fn(*args)

def setup_arithmetic(env):
    env.define('+', LispPrimitive(lambda x, y: x + y))
    env.define('-', LispPrimitive(lambda x, y: x - y))
    env.define('*', LispPrimitive(lambda x, y: x * y))
    env.define('/', LispPrimitive(lambda x, y: x / y))
```

2. **Манипуляции со списками**:
```lisp
; Реализация на Lisp
(define (map fn lst)
  (if (null? lst)
      '()
      (cons (fn (car lst))
            (map fn (cdr lst)))))

; Реализация на Python
def lisp_map(fn, lst):
    if not lst:
        return []
    return Cons(fn(lst.car), lisp_map(fn, lst.cdr))

def setup_list_ops(env):
    env.define('map', Lambda(['fn', 'lst'], 
        ['if', ['null?', 'lst'],
         [], 
         ['cons', 
          ['fn', ['car', 'lst']], 
          ['map', 'fn', ['cdr', 'lst']]]]))
```

### Примеры реального использования Lisp

1. **Парсер JSON**:
```lisp
(define (parse-json str)
  (let ((tokens (tokenize str)))
    (parse-json-object tokens)))

(define (parse-json-object tokens)
  (case (car tokens)
    ('{' (parse-object (cdr tokens)))
    ('[' (parse-array (cdr tokens)))
    (else (parse-primitive tokens))))

; Реализация на Python
class JsonParser:
    def __init__(self, env):
        self.env = env
        
    def parse(self, tokens):
        if tokens[0] == '{':
            return self.parse_object(tokens[1:])
        elif tokens[0] == '[':
            return self.parse_array(tokens[1:])
        return self.parse_primitive(tokens)
```

2. **Веб-роутер**:
```lisp
(define-macro (route path handler)
  `(add-route *router* ,path ,handler))

(route "/users/:id"
       (lambda (req)
         (let ((user-id (get-param req :id)))
           (find-user user-id))))

; Реализация на Python
class Router:
    def __init__(self):
        self.routes = {}
        
    def add_route(self, path, handler):
        self.routes[path] = handler
        
    def handle_request(self, path, request):
        handler = self.routes.get(path)
        if handler:
            return handler(request)
        raise NotFoundError(f"Маршрут не найден: {path}")
```

### Реализация продвинутых возможностей Lisp

1. **Сопоставление с образцом**:
```python
class Pattern:
    def __init__(self, type_pattern, value_pattern=None):
        self.type_pattern = type_pattern
        self.value_pattern = value_pattern
    
    def match(self, value):
        if not isinstance(value, self.type_pattern):
            return None
        
        if self.value_pattern is None:
            return {}
        
        if callable(self.value_pattern):
            return self.value_pattern(value)
        
        return {'value': value} if value == self.value_pattern else None

def define_pattern_macro(env):
    def match_macro(pattern, expr):
        return ['let', 
                [Pattern(pattern).match(expr, env)],
                ['if', ['null?', 'bindings'],
                 'false',
                 'bindings']]
    env.define('match', Macro(match_macro))
```

2. **Ленивые вычисления**:
```python
class Promise:
    def __init__(self, expr, env):
        self.expr = expr
        self.env = env
        self.evaluated = False
        self.value = None
    
    def force(self):
        if not self.evaluated:
            self.value = eval(self.expr, self.env)
            self.evaluated = True
        return self.value

def define_lazy_primitives(env):
    env.define('delay', 
               lambda expr: Promise(expr, env))
    env.define('force',
               lambda promise: promise.force())
```

---

[← Предыдущая глава](#глава-6) | [Следующая глава: Концепции функционального программирования →](#глава-8)

<a name="глава-8"></a>
# Глава 8: Концепции функционального программирования

## Цели обучения
К концу этой главы вы:
- Освоите парадигмы функционального программирования
- Поймете неизменяемость и чистые функции
- Реализуете функции высшего порядка
- Научитесь работать с монадами и функторами

## 8.1 Чистые функции и неизменяемость

### 8.1.1 Понимание чистых функций
```python
# Нечистая функция
total = 0
def add_to_total(x):
    global total
    total += x
    return total

# Чистая функция
def add_numbers(x, y):
    return x + y

# Реализация в нашем Lisp
def is_pure_function(fn, env):
    # Проверка, изменяет ли функция внешнее состояние
    original_env = env.copy()
    result1 = fn(1)
    env.restore(original_env)
    result2 = fn(1)
    return result1 == result2
```

### 8.1.2 Неизменяемые структуры данных
```python
class ImmutableList:
    def __init__(self, items):
        self._items = tuple(items)
    
    def append(self, item):
        return ImmutableList(self._items + (item,))
    
    def remove(self, item):
        return ImmutableList(x for x in self._items if x != item)
```

## 8.2 Функции высшего порядка

### 8.2.1 Map, Filter и Reduce
```lisp
; Реализация map
(define (map fn lst)
  (if (null? lst)
      '()
      (cons (fn (car lst))
            (map fn (cdr lst)))))

; Реализация filter
(define (filter pred lst)
  (cond ((null? lst) '())
        ((pred (car lst))
         (cons (car lst)
               (filter pred (cdr lst))))
        (else (filter pred (cdr lst)))))

; Реализация reduce
(define (reduce fn init lst)
  (if (null? lst)
      init
      (reduce fn
              (fn init (car lst))
              (cdr lst))))
```

### 8.2.2 Композиция функций
```python
def compose(*fns):
    def composed(x):
        result = x
        for fn in reversed(fns):
            result = fn(result)
        return result
    return composed

# В нашем Lisp
(define (compose f g)
  (lambda (x)
    (f (g x))))
```

## 8.3 Продвинутые функциональные концепции

### 8.3.1 Каррирование
```python
def curry(fn):
    def curried(*args):
        if len(args) >= fn.__code__.co_argcount:
            return fn(*args)
        return lambda *more: curried(*(args + more))
    return curried

# Пример использования
@curry
def add(x, y, z):
    return x + y + z

add_five = add(5)
add_five_and_ten = add_five(10)
result = add_five_and_ten(15)  # 30
```

### 8.3.2 Монады
```python
class Maybe:
    def __init__(self, value):
        self.value = value
    
    def bind(self, fn):
        if self.value is None:
            return Maybe(None)
        return fn(self.value)
    
    @staticmethod
    def unit(value):
        return Maybe(value)

# Пример использования
def safe_divide(x, y):
    return Maybe(x / y if y != 0 else None)

def safe_sqrt(x):
    return Maybe(math.sqrt(x) if x >= 0 else None)
```

## Практические упражнения

1. **Реализация чистых функций**
   - Создайте чистые версии распространенных функций
   - Реализуйте неизменяемые структуры данных
   - Напишите референциально прозрачный код

2. **Функции высшего порядка**
   - Реализуйте map, filter, reduce
   - Создайте утилиты для композиции функций
   - Постройте систему каррирования

3. **Монадические операции**
   - Реализуйте монаду Maybe
   - Создайте монаду List
   - Постройте монадические преобразования

## Контрольные вопросы

1. Что делает функцию чистой?
2. Как функции высшего порядка улучшают повторное использование кода?
3. Каковы преимущества неизменяемости?
4. Как монады помогают управлять побочными эффектами?

## Дополнительное чтение
- Введение в функциональное программирование (Bird & Wadler)
- Теория категорий для программистов (Bartosz Milewski)
- Функциональное программирование в Scala (Chiusano & Bjarnason)

## Подсказки к решениям упражнений главы 8

### Решения для реализации чистых функций
1. **Простая система типов**:
```python
class Type:
    def __init__(self, name, size):
        self.name = name
        self.size = size  # Размер в байтах

# Базовые типы
INTEGER = Type("int", 4)
FLOAT = Type("float", 8)
CHAR = Type("char", 1)

class TypeChecker:
    def check_operation(self, op, left_type, right_type):
        if op in ['+', '-', '*', '/']:
            if left_type == INTEGER and right_type == INTEGER:
                return INTEGER
            elif left_type == FLOAT or right_type == FLOAT:
                return FLOAT
        raise TypeError(f"Недопустимая операция {op} между {left_type.name} и {right_type.name}")
```

2. **Механизм области видимости переменных**:
```python
class Scope:
    def __init__(self, parent=None):
        self.symbols = {}
        self.parent = parent
    
    def define(self, name, value):
        self.symbols[name] = value
    
    def resolve(self, name):
        if name in self.symbols:
            return self.symbols[name]
        if self.parent:
            return self.parent.resolve(name)
        raise NameError(f"Имя '{name}' не определено")

# Пример использования
global_scope = Scope()
function_scope = Scope(global_scope)
block_scope = Scope(function_scope)
```

3. **Система вызова функций**:
```python
class CallFrame:
    def __init__(self, function, return_addr):
        self.local_vars = {}
        self.function = function
        self.return_addr = return_addr

class VirtualMachine:
    def __init__(self):
        self.call_stack = []
        self.current_frame = None
    
    def call_function(self, func, args):
        frame = CallFrame(func, self.instruction_pointer)
        self.call_stack.append(frame)
        self.current_frame = frame
        
        # Настройка параметров
        for param, arg in zip(func.params, args):
            frame.local_vars[param] = arg
            
        # Выполнение тела функции
        result = self.execute(func.body)
        
        # Восстановление предыдущего кадра
        self.call_stack.pop()
        self.current_frame = self.call_stack[-1] if self.call_stack else None
        return result
```

### Дополнительные сравнения языков

1. **Условные операторы**:
```nasm
; If-else на ассемблере
    cmp eax, 0
    jle is_negative
    ; код для положительного случая
    jmp end_if
is_negative:
    ; код для отрицательного случая
end_if:
```

```python
# Эквивалент на Python
if x > 0:
    # код для положительного случая
else:
    # код для отрицательного случая
```

2. **Вызовы функций**:
```nasm
; Функция на ассемблере
calculate:
    push rbp
    mov rbp, rsp
    ; тело функции
    mov rsp, rbp
    pop rbp
    ret

; Место вызова
    call calculate
```

```python
# Эквивалент на Python
def calculate():
    # тело функции
    return result

# Место вызова
result = calculate()
```

3. **Операции с массивами**:
```nasm
; Доступ к массиву на ассемблере
    mov rax, [array + rdi * 8]  ; array[i]
```

```python
# Эквивалент на Python
value = array[i]
```

---

[← Предыдущая глава](#глава-7) | [Следующая глава: Основы интерпретатора →](#глава-9)

<a name="глава-9"></a>
# Глава 9: Основы интерпретатора

## Цели обучения
К концу этой главы вы:
- Поймете основные компоненты интерпретатора
- Реализуете лексический анализатор и парсер
- Создадите систему вычисления выражений
- Научитесь управлять окружением и областями видимости

## 9.1 Архитектура интерпретатора

### 9.1.1 Основные компоненты
```python
class Interpreter:
    def __init__(self):
        self.lexer = Lexer()
        self.parser = Parser()
        self.evaluator = Evaluator()
        self.global_env = Environment()
    
    def interpret(self, source):
        tokens = self.lexer.tokenize(source)
        ast = self.parser.parse(tokens)
        return self.evaluator.evaluate(ast, self.global_env)
```

### 9.1.2 Поток данных
```
Исходный код → Лексер → Токены → Парсер → AST → Вычислитель → Результат
```

## 9.2 Лексический анализ

### 9.2.1 Реализация лексера
```python
class Token:
    def __init__(self, type, value):
        self.type = type
        self.value = value

class Lexer:
    def __init__(self):
        self.pos = 0
        self.text = ""
        self.current_char = None
    
    def tokenize(self, text):
        self.text = text
        self.pos = 0
        self.current_char = self.text[0] if text else None
        tokens = []
        
        while self.current_char:
            if self.current_char.isspace():
                self.advance()
                continue
            
            if self.current_char.isdigit():
                tokens.append(self.number())
            elif self.current_char.isalpha():
                tokens.append(self.identifier())
            elif self.current_char in '+-*/()':
                tokens.append(Token('OPERATOR', self.current_char))
                self.advance()
            else:
                raise SyntaxError(f"Неизвестный символ: {self.current_char}")
        
        tokens.append(Token('EOF', None))
        return tokens
```

## 9.3 Синтаксический анализ

### 9.3.1 Построение AST
```python
class ASTNode:
    pass

class BinaryOp(ASTNode):
    def __init__(self, left, op, right):
        self.left = left
        self.op = op
        self.right = right

class Number(ASTNode):
    def __init__(self, value):
        self.value = value

class Parser:
    def __init__(self):
        self.tokens = []
        self.pos = 0
        self.current_token = None
    
    def parse(self, tokens):
        self.tokens = tokens
        self.pos = 0
        self.current_token = self.tokens[0]
        return self.expr()
    
    def expr(self):
        node = self.term()
        
        while self.current_token.type == 'OPERATOR' and \
              self.current_token.value in '+-':
            op = self.current_token.value
            self.advance()
            right = self.term()
            node = BinaryOp(node, op, right)
        
        return node
```

## 9.4 Вычисление выражений

### 9.4.1 Реализация вычислителя
```python
class Evaluator:
    def evaluate(self, node, env):
        method = f'eval_{type(node).__name__}'
        return getattr(self, method)(node, env)
    
    def eval_Number(self, node, env):
        return node.value
    
    def eval_BinaryOp(self, node, env):
        left = self.evaluate(node.left, env)
        right = self.evaluate(node.right, env)
        
        if node.op == '+':
            return left + right
        elif node.op == '-':
            return left - right
        elif node.op == '*':
            return left * right
        elif node.op == '/':
            return left / right
```

### 9.4.2 Управление окружением
```python
class Environment:
    def __init__(self, parent=None):
        self.values = {}
        self.parent = parent
    
    def get(self, name):
        if name in self.values:
            return self.values[name]
        if self.parent:
            return self.parent.get(name)
        raise NameError(f"Имя '{name}' не определено")
    
    def set(self, name, value):
        self.values[name] = value
```

## 9.5 Обработка ошибок

### 9.5.1 Типы ошибок
```python
class InterpreterError(Exception):
    pass

class LexerError(InterpreterError):
    pass

class ParserError(InterpreterError):
    pass

class RuntimeError(InterpreterError):
    pass
```

### 9.5.2 Обработка ошибок
```python
def safe_evaluate(self, source):
    try:
        return self.evaluate(source)
    except LexerError as e:
        return f"Ошибка лексического анализа: {e}"
    except ParserError as e:
        return f"Ошибка синтаксического анализа: {e}"
    except RuntimeError as e:
        return f"Ошибка времени выполнения: {e}"
```

## Практические упражнения

1. **Расширение лексера**
   - Добавьте поддержку строковых литералов
   - Реализуйте многострочные комментарии
   - Добавьте поддержку шестнадцатеричных чисел

2. **Улучшение парсера**
   - Добавьте поддержку функций
   - Реализуйте условные выражения
   - Добавьте циклы и итерации

3. **Оптимизация вычислителя**
   - Реализуйте константные выражения
   - Добавьте кэширование результатов
   - Оптимизируйте рекурсивные вызовы

## Контрольные вопросы

1. Каковы основные компоненты интерпретатора?
2. Как работает процесс лексического анализа?
3. Какова роль AST в интерпретаторе?
4. Как реализуется вычисление выражений?

## Дополнительное чтение
- Создание языков программирования (Thorsten Ball)
- Компиляторы: принципы, технологии и инструменты
- Реализация языков программирования (Terrence Parr)

## Подсказки к решениям упражнений главы 9

### Решения для расширения лексера
1. **Поддержка строковых литералов**:
```python
def string(self):
    result = ''
    self.advance()  # Пропустить открывающую кавычку
    
    while self.current_char and self.current_char != '"':
        if self.current_char == '\\':
            self.advance()
            if self.current_char == 'n':
                result += '\n'
            elif self.current_char == 't':
                result += '\t'
            else:
                result += self.current_char
        else:
            result += self.current_char
        self.advance()
    
    if not self.current_char:
        raise LexerError("Незакрытая строка")
    
    self.advance()  # Пропустить закрывающую кавычку
    return Token('STRING', result)
```

2. **Многострочные комментарии**:
```python
def skip_comment(self):
    while self.current_char and \
          not (self.current_char == '*' and self.peek() == '/'):
        self.advance()
    self.advance()  # Пропустить *
    self.advance()  # Пропустить /
```

### Решения для улучшения парсера
1. **Поддержка функций**:
```python
class FunctionNode(ASTNode):
    def __init__(self, params, body):
        self.params = params
        self.body = body

def parse_function(self):
    self.match('FUNCTION')
    params = self.parse_parameters()
    body = self.parse_block()
    return FunctionNode(params, body)
```

2. **Условные выражения**:
```python
class IfNode(ASTNode):
    def __init__(self, condition, then_branch, else_branch=None):
        self.condition = condition
        self.then_branch = then_branch
        self.else_branch = else_branch

def parse_if(self):
    self.match('IF')
    condition = self.parse_expression()
    then_branch = self.parse_block()
    else_branch = None
    
    if self.current_token.type == 'ELSE':
        self.match('ELSE')
        else_branch = self.parse_block()
    
    return IfNode(condition, then_branch, else_branch)
```

---

[← Предыдущая глава](#глава-8) | [Следующая глава: Продвинутые возможности интерпретатора →](#глава-10)

<a name="глава-10"></a>
# Глава 10: Продвинутые возможности интерпретатора

## Цели обучения
К концу этой главы вы:
- Поймете расширенные возможности интерпретатора
- Изучите механизмы оптимизации и эффективности
- Реализуете расширенные возможности языка
- Научитесь работать с различными типами данных

## 10.1 Расширенные возможности интерпретатора

### 10.1.1 Оптимизация и эффективность
```python
# Простая оптимизация
def optimize(expr):
    if isinstance(expr, BinaryOp) and expr.op == '+':
        return Number(expr.left.value + expr.right.value)
    return expr

# Эффективное использование памяти
def efficient_memory_usage(expr):
    if isinstance(expr, Number):
        return Number(expr.value)
    elif isinstance(expr, BinaryOp):
        left = efficient_memory_usage(expr.left)
        right = efficient_memory_usage(expr.right)
        return BinaryOp(left, expr.op, right)
    return expr
```

### 10.1.2 Расширенные типы данных
```python
# Добавление новых типов данных
class Float(Number):
    def __init__(self, value):
        self.value = float(value)

class String(Number):
    def __init__(self, value):
        self.value = str(value)

# Обработка новых типов
def evaluate_float(expr):
    if isinstance(expr, Float):
        return expr.value
    elif isinstance(expr, BinaryOp):
        left = evaluate_float(expr.left)
        right = evaluate_float(expr.right)
        return BinaryOp(left, expr.op, right)
    return expr

def evaluate_string(expr):
    if isinstance(expr, String):
        return expr.value
    elif isinstance(expr, BinaryOp):
        left = evaluate_string(expr.left)
        right = evaluate_string(expr.right)
        return BinaryOp(left, expr.op, right)
    return expr
```

### 10.1.3 Расширенные возможности языка
```python
# Добавление новых возможностей
def add_new_features(expr):
    if isinstance(expr, BinaryOp):
        if expr.op == '+':
            return BinaryOp(expr.left, '+', expr.right)
        elif expr.op == '-':
            return BinaryOp(expr.left, '-', expr.right)
    return expr
```

## 10.2 Практические упражнения

1. **Оптимизация вычислений**
   - Реализуйте простую оптимизацию
   - Добавьте эффективное использование памяти
   - Создайте расширенные типы данных

2. **Расширенные возможности языка**
   - Добавьте новые возможности
   - Реализуйте расширенные типы данных
   - Постройте систему поддержки различных типов

3. **Улучшение интерпретатора**
   - Добавьте поддержку многострочных комментариев
   - Реализуйте поддержку шестнадцатеричных чисел
   - Добавьте поддержку строковых литералов

## Контрольные вопросы

1. Как расширить возможности интерпретатора?
2. Какие механизмы оптимизации можно использовать?
3. Как добавить новые возможности языку?
4. Как работает расширенная система типов?

## Дополнительное чтение
- Оптимизация программирования (Donald Knuth)
- Эффективное программирование (Brian W. Kernighan)
- Современные подходы к программированию (Martin Odersky)

## Подсказки к решениям упражнений главы 10

### Решения для оптимизации
1. **Простая оптимизация**:
```python
# Простая оптимизация
def optimize(expr):
    if isinstance(expr, BinaryOp) and expr.op == '+':
        return Number(expr.left.value + expr.right.value)
    return expr

# Эффективное использование памяти
def efficient_memory_usage(expr):
    if isinstance(expr, Number):
        return Number(expr.value)
    elif isinstance(expr, BinaryOp):
        left = efficient_memory_usage(expr.left)
        right = efficient_memory_usage(expr.right)
        return BinaryOp(left, expr.op, right)
    return expr
```

2. **Эффективное использование памяти**:
```python
# Эффективное использование памяти
def efficient_memory_usage(expr):
    if isinstance(expr, Number):
        return Number(expr.value)
    elif isinstance(expr, BinaryOp):
        left = efficient_memory_usage(expr.left)
        right = efficient_memory_usage(expr.right)
        return BinaryOp(left, expr.op, right)
    return expr
```

### Решения для расширения возможностей
1. **Добавление новых типов данных**:
```python
# Добавление новых типов данных
class Float(Number):
    def __init__(self, value):
        self.value = float(value)

class String(Number):
    def __init__(self, value):
        self.value = str(value)

# Обработка новых типов
def evaluate_float(expr):
    if isinstance(expr, Float):
        return expr.value
    elif isinstance(expr, BinaryOp):
        left = evaluate_float(expr.left)
        right = evaluate_float(expr.right)
        return BinaryOp(left, expr.op, right)
    return expr

def evaluate_string(expr):
    if isinstance(expr, String):
        return expr.value
    elif isinstance(expr, BinaryOp):
        left = evaluate_string(expr.left)
        right = evaluate_string(expr.right)
        return BinaryOp(left, expr.op, right)
    return expr
```

2. **Добавление новых возможностей**:
```python
# Добавление новых возможностей
def add_new_features(expr):
    if isinstance(expr, BinaryOp):
        if expr.op == '+':
            return BinaryOp(expr.left, '+', expr.right)
        elif expr.op == '-':
            return BinaryOp(expr.left, '-', expr.right)
    return expr
```

---

[← Предыдущая глава](#глава-9) | [Следующая глава: Сопрограммы и современное программирование →](#глава-11)

<a name="глава-11"></a>
# Глава 11: Сопрограммы и современное программирование

## Цели обучения
К концу этой главы вы:
- Поймете основные концепции сопрограмм и асинхронного программирования
- Реализуете эффективные асинхронные системы
- Освоите работу с событийным циклом
- Научитесь создавать масштабируемые приложения

## 11.1 Основы асинхронного программирования

### 11.1.1 Понимание асинхронности
```python
# Традиционный синхронный код
def fetch_data():
    data = read_from_database()  # Блокирует выполнение
    process_data(data)
    return data

# Асинхронный подход
async def fetch_data():
    data = await read_from_database()  # Освобождает поток
    await process_data(data)
    return data
```

### 11.1.2 Событийный цикл
```python
class EventLoop:
    def __init__(self):
        self.tasks = deque()
        self.running = False
    
    def add_task(self, coro):
        self.tasks.append(coro)
    
    async def run(self):
        self.running = True
        while self.running and self.tasks:
            task = self.tasks.popleft()
            try:
                await task
            except Exception as e:
                print(f"Error in task: {e}")
```

## 11.2 Реализация сопрограмм

### 11.2.1 Базовая структура
```python
class Coroutine:
    def __init__(self):
        self.value = None
        self.complete = False
    
    def send(self, value):
        self.value = value
        # Логика выполнения
        return self.value
    
    def throw(self, exc):
        # Обработка исключений
        pass
```

### 11.2.2 Асинхронные генераторы
```python
async def async_range(start, stop):
    for i in range(start, stop):
        await asyncio.sleep(0.1)  # Имитация асинхронной работы
        yield i

async def use_generator():
    async for num in async_range(0, 5):
        print(num)
```

## 11.3 Управление ресурсами

### 11.3.1 Асинхронные контекстные менеджеры
```python
class AsyncResource:
    async def __aenter__(self):
        await self.connect()
        return self
    
    async def __aexit__(self, exc_type, exc, tb):
        await self.cleanup()

async def use_resource():
    async with AsyncResource() as res:
        await res.process()
```

### 11.3.2 Пулы и очереди
```python
class AsyncPool:
    def __init__(self, size):
        self.size = size
        self.tasks = asyncio.Queue()
        self.workers = []
    
    async def worker(self):
        while True:
            task = await self.tasks.get()
            try:
                await task()
            finally:
                self.tasks.task_done()
```

## 11.4 Продвинутые паттерны

### 11.4.1 Публикация-подписка
```python
class AsyncPubSub:
    def __init__(self):
        self.subscribers = defaultdict(set)
    
    async def subscribe(self, topic, callback):
        self.subscribers[topic].add(callback)
    
    async def publish(self, topic, message):
        for callback in self.subscribers[topic]:
            await callback(message)
```

### 11.4.2 Асинхронные итераторы
```python
class AsyncIterator:
    def __init__(self, data):
        self.data = data
        self.index = 0
    
    def __aiter__(self):
        return self
    
    async def __anext__(self):
        if self.index >= len(self.data):
            raise StopAsyncIteration
        value = self.data[self.index]
        self.index += 1
        return value
```

## 11.5 Оптимизация и масштабирование

### 11.5.1 Управление памятью
```python
class MemoryManager:
    def __init__(self, limit):
        self.limit = limit
        self.current = 0
        self.blocks = []
    
    async def allocate(self, size):
        if self.current + size > self.limit:
            await self.cleanup()
        self.current += size
        block = MemoryBlock(size)
        self.blocks.append(block)
        return block
```

### 11.5.2 Балансировка нагрузки
```python
class LoadBalancer:
    def __init__(self, workers):
        self.workers = workers
        self.current = 0
    
    async def distribute(self, task):
        worker = self.workers[self.current]
        self.current = (self.current + 1) % len(self.workers)
        return await worker.process(task)
```

## Практические упражнения

1. **Базовые сопрограммы**
   - Создайте простой асинхронный веб-сервер
   - Реализуйте асинхронный клиент базы данных
   - Напишите систему асинхронной обработки задач

2. **Продвинутые паттерны**
   - Реализуйте асинхронный пул соединений
   - Создайте систему распределенных вычислений
   - Постройте асинхронный кэш

3. **Оптимизация**
   - Оптимизируйте использование памяти
   - Улучшите производительность событийного цикла
   - Реализуйте эффективную балансировку нагрузки

## Контрольные вопросы

1. В чем преимущества асинхронного программирования?
2. Как работает событийный цикл?
3. Какие паттерны проектирования подходят для асинхронных систем?
4. Как оптимизировать асинхронные приложения?

## Дополнительное чтение
- Асинхронное программирование на Python (Caleb Hattingh)
- Высоконагруженные приложения (Martin Kleppmann)
- Паттерны асинхронного программирования

---

[← Предыдущая глава](#глава-10) | [Следующая глава: Объединяя всё вместе →](#глава-12)

<a name="глава-12"></a>
# Глава 12: Объединяя всё вместе

## Цели обучения
К концу этой главы вы:
- Поймете, как все компоненты взаимодействуют друг с другом
- Освоите принципы проектирования и архитектуры
- Научитесь создавать сложные системы
- Реализуете базовую систему обработки исключений

## 12.1 Общая архитектура

### 12.1.1 Основные компоненты
1. **Центральный процессор (CPU)**
   - "Мозг" компьютера
   - Выполняет инструкции
   - Содержит регистры для временного хранения данных
   - Выполняет арифметические и логические операции

2. **Память (RAM)**
   - Временное хранилище для программ и данных
   - Организована в адресуемые ячейки
   - Прямое взаимодействие с CPU
   - Энергозависимая память (очищается при выключении)

3. **Ввод/Вывод (I/O)**
   - Взаимодействие с внешним миром
   - Обработка ввода и вывода данных
   - Управление коммуникацией устройств

## 12.2 Взаимодействие компонентов

### 12.2.1 Системные вызовы и прерывания
```python
class SystemCallHandler:
    def __init__(self):
        self.handlers = {
            1: self.sys_write,
            2: self.sys_read,
            3: self.sys_open,
            4: self.sys_close
        }
    
    def handle_syscall(self, number, *args):
        if number in self.handlers:
            return self.handlers[number](*args)
        raise Exception(f"Недопустимый системный вызов {number}")
    
    def sys_write(self, fd, buffer, size):
        # Реализация
        pass
```

### 12.2.2 Управление памятью
```python
class MemoryManager:
    def __init__(self, limit):
        self.limit = limit
        self.current = 0
        self.blocks = []
    
    async def allocate(self, size):
        if self.current + size > self.limit:
            await self.cleanup()
        self.current += size
        block = MemoryBlock(size)
        self.blocks.append(block)
        return block
```

### 12.2.3 Управление кучей
```python
class HeapManager:
    def __init__(self, start_addr, size):
        self.start = start_addr
        self.size = size
        self.blocks = [(start_addr, size, False)]  # (адрес, размер, используется)
    
    def allocate(self, size):
        # Алгоритм первого подходящего
        for i, (addr, block_size, used) in enumerate(self.blocks):
            if not used and block_size >= size:
                self.blocks[i] = (addr, size, True)
                if block_size > size:
                    # Разделить блок
                    self.blocks.insert(i + 1, 
                        (addr + size, block_size - size, False))
                return addr
        return None  # Нет свободной памяти
```

### 12.2.4 Управление потоками
```python
class ThreadManager:
    def __init__(self):
        self.threads = []
    
    def create_thread(self, entry_point):
        thread = Thread(entry_point)
        self.threads.append(thread)
        return thread
    
    def run_threads(self):
        for thread in self.threads:
            thread.start()
            thread.join()
```

## 12.3 Проектирование и архитектура

### 12.3.1 Системные вызовы и прерывания
```python
class SystemCallHandler:
    def __init__(self):
        self.handlers = {
            1: self.sys_write,
            2: self.sys_read,
            3: self.sys_open,
            4: self.sys_close
        }
    
    def handle_syscall(self, number, *args):
        if number in self.handlers:
            return self.handlers[number](*args)
        raise Exception(f"Недопустимый системный вызов {number}")
    
    def sys_write(self, fd, buffer, size):
        # Реализация
        pass
```

### 12.3.2 Управление памятью
```python
class MemoryManager:
    def __init__(self, limit):
        self.limit = limit
        self.current = 0
        self.blocks = []
    
    async def allocate(self, size):
        if self.current + size > self.limit:
            await self.cleanup()
        self.current += size
        block = MemoryBlock(size)
        self.blocks.append(block)
        return block
```

### 12.3.3 Управление кучей
```python
class HeapManager:
    def __init__(self, start_addr, size):
        self.start = start_addr
        self.size = size
        self.blocks = [(start_addr, size, False)]  # (адрес, размер, используется)
    
    def allocate(self, size):
        # Алгоритм первого подходящего
        for i, (addr, block_size, used) in enumerate(self.blocks):
            if not used and block_size >= size:
                self.blocks[i] = (addr, size, True)
                if block_size > size:
                    # Разделить блок
                    self.blocks.insert(i + 1, 
                        (addr + size, block_size - size, False))
                return addr
        return None  # Нет свободной памяти
```

### 12.3.4 Управление потоками
```python
class ThreadManager:
    def __init__(self):
        self.threads = []
    
    def create_thread(self, entry_point):
        thread = Thread(entry_point)
        self.threads.append(thread)
        return thread
    
    def run_threads(self):
        for thread in self.threads:
            thread.start()
            thread.join()
```

## 12.4 Обработка ошибок

### 12.4.1 Системные вызовы и прерывания
```python
class SystemCallHandler:
    def __init__(self):
        self.handlers = {
            1: self.sys_write,
            2: self.sys_read,
            3: self.sys_open,
            4: self.sys_close
        }
    
    def handle_syscall(self, number, *args):
        if number in self.handlers:
            return self.handlers[number](*args)
        raise Exception(f"Недопустимый системный вызов {number}")
    
    def sys_write(self, fd, buffer, size):
        # Реализация
        pass
```

### 12.4.2 Обработка прерываний
```python
class InterruptHandler:
    def __init__(self):
        self.interrupt_vector = [None] * 256
        self.setup_handlers()
    
    def setup_handlers(self):
        self.interrupt_vector[0x80] = self.syscall_handler
        self.interrupt_vector[0x0E] = self.page_fault_handler
        
    def handle_interrupt(self, number, error_code=None):
        handler = self.interrupt_vector[number]
        if handler:
            return handler(error_code)
        raise Exception(f"Необработанное прерывание {number}")
```

### 12.4.3 Обработка ошибок системных вызовов
```python
class SystemCallError(Exception):
    pass

def handle_syscall_error(error_code):
    if error_code < 0:
        raise SystemCallError(f"Ошибка системного вызова: {error_code}")
```

### 12.4.4 Обработка ошибок памяти
```python
class MemoryError(Exception):
    pass

def handle_memory_error(error_code):
    if error_code < 0:
        raise MemoryError(f"Ошибка памяти: {error_code}")
```

### 12.4.5 Обработка ошибок потоков
```python
class ThreadError(Exception):
    pass

def handle_thread_error(error_code):
    if error_code < 0:
        raise ThreadError(f"Ошибка потока: {error_code}")
```

## 12.5 Масштабирование и оптимизация

### 12.5.1 Управление памятью
```python
class MemoryManager:
    def __init__(self, limit):
        self.limit = limit
        self.current = 0
        self.blocks = []
    
    async def allocate(self, size):
        if self.current + size > self.limit:
            await self.cleanup()
        self.current += size
        block = MemoryBlock(size)
        self.blocks.append(block)
        return block
```

### 12.5.2 Управление кучей
```python
class HeapManager:
    def __init__(self, start_addr, size):
        self.start = start_addr
        self.size = size
        self.blocks = [(start_addr, size, False)]  # (адрес, размер, используется)
    
    def allocate(self, size):
        # Алгоритм первого подходящего
        for i, (addr, block_size, used) in enumerate(self.blocks):
            if not used and block_size >= size:
                self.blocks[i] = (addr, size, True)
                if block_size > size:
                    # Разделить блок
                    self.blocks.insert(i + 1, 
                        (addr + size, block_size - size, False))
                return addr
        return None  # Нет свободной памяти
```

### 12.5.3 Управление потоками
```python
class ThreadManager:
    def __init__(self):
        self.threads = []
    
    def create_thread(self, entry_point):
        thread = Thread(entry_point)
        self.threads.append(thread)
        return thread
    
    def run_threads(self):
        for thread in self.threads:
            thread.start()
            thread.join()
```

## 12.6 Система обработки исключений

### 12.6.1 Базовая структура
```python
class ExceptionHandler:
    def __init__(self):
        self.handlers = {}
    
    def register_handler(self, exception_type, handler):
        self.handlers[exception_type] = handler
    
    def handle_exception(self, exception):
        handler = self.handlers.get(type(exception))
        if handler:
            return handler(exception)
        raise exception
```

### 12.6.2 Обработка исключений
```python
class ExceptionHandler:
    def __init__(self):
        self.handlers = {}
    
    def register_handler(self, exception_type, handler):
        self.handlers[exception_type] = handler
    
    def handle_exception(self, exception):
        handler = self.handlers.get(type(exception))
        if handler:
            return handler(exception)
        raise exception
```

### 12.6.3 Обработка исключений системных вызовов
```python
class SystemCallError(Exception):
    pass

def handle_syscall_error(error_code):
    if error_code < 0:
        raise SystemCallError(f"Ошибка системного вызова: {error_code}")
```

### 12.6.4 Обработка исключений памяти
```python
class MemoryError(Exception):
    pass

def handle_memory_error(error_code):
    if error_code < 0:
        raise MemoryError(f"Ошибка памяти: {error_code}")
```

### 12.6.5 Обработка исключений потоков
```python
class ThreadError(Exception):
    pass

def handle_thread_error(error_code):
    if error_code < 0:
        raise ThreadError(f"Ошибка потока: {error_code}")
```

## 12.7 Масштабирование и оптимизация

### 12.7.1 Управление памятью
```python
class MemoryManager:
    def __init__(self, limit):
        self.limit = limit
        self.current = 0
        self.blocks = []
    
    async def allocate(self, size):
        if self.current + size > self.limit:
            await self.cleanup()
        self.current += size
        block = MemoryBlock(size)
        self.blocks.append(block)
        return block
```

### 12.7.2 Управление кучей
```python
class HeapManager:
    def __init__(self, start_addr, size):
        self.start = start_addr
        self.size = size
        self.blocks = [(start_addr, size, False)]  # (адрес, размер, используется)
    
    def allocate(self, size):
        # Алгоритм первого подходящего
        for i, (addr, block_size, used) in enumerate(self.blocks):
            if not used and block_size >= size:
                self.blocks[i] = (addr, size, True)
                if block_size > size:
                    # Разделить блок
                    self.blocks.insert(i + 1, 
                        (addr + size, block_size - size, False))
                return addr
        return None  # Нет свободной памяти
```

### 12.7.3 Управление потоками
```python
class ThreadManager:
    def __init__(self):
        self.threads = []
    
    def create_thread(self, entry_point):
        thread = Thread(entry_point)
        self.threads.append(thread)
        return thread
    
    def run_threads(self):
        for thread in self.threads:
            thread.start()
            thread.join()
```

## 12.8 Система обработки исключений

### 12.8.1 Базовая структура
```python
class ExceptionHandler:
    def __init__(self):
        self.handlers = {}
    
    def register_handler(self, exception_type, handler):
        self.handlers[exception_type] = handler
    
    def handle_exception(self, exception):
        handler = self.handlers.get(type(exception))
        if handler:
            return handler(exception)
        raise exception
```

### 12.8.2 Обработка исключений
```python
class ExceptionHandler:
    def __init__(self):
        self.handlers = {}
    
    def register_handler(self, exception_type, handler):
        self.handlers[exception_type] = handler
    
    def handle_exception(self, exception):
        handler = self.handlers.get(type(exception))
        if handler:
            return handler(exception)
        raise exception
```

### 12.8.3 Обработка исключений системных вызовов
```python
class SystemCallError(Exception):
    pass

def handle_syscall_error(error_code):
    if error_code < 0:
        raise SystemCallError(f"Ошибка системного вызова: {error_code}")
```

### 12.8.4 Обработка исключений памяти
```python
class MemoryError(Exception):
    pass

def handle_memory_error(error_code):
    if error_code < 0:
        raise MemoryError(f"Ошибка памяти: {error_code}")
```

### 12.8.5 Обработка исключений потоков
```python
class ThreadError(Exception):
    pass

def handle_thread_error(error_code):
    if error_code < 0:
        raise ThreadError(f"Ошибка потока: {error_code}")
```

## 12.9 Масштабирование и оптимизация

### 12.9.1 Управление памятью
```python
class MemoryManager:
    def __init__(self, limit):
        self.limit = limit
        self.current = 0
        self.blocks = []
    
    async def allocate(self, size):
        if self.current + size > self.limit:
            await self.cleanup()
        self.current += size
        block = MemoryBlock(size)
        self.blocks.append(block)
        return block
```

### 12.9.2 Управление кучей
```python
class HeapManager:
    def __init__(self, start_addr, size):
        self.start = start_addr
        self.size = size
        self.blocks = [(start_addr, size, False)]  # (адрес, размер, используется)
    
    def allocate(self, size):
        # Алгоритм первого подходящего
        for i, (addr, block_size, used) in enumerate(self.blocks):
            if not used and block_size >= size:
                self.blocks[i] = (addr, size, True)
                if block_size > size:
                    # Разделить блок
                    self.blocks.insert(i + 1, 
                        (addr + size, block_size - size, False))
                return addr
        return None  # Нет свободной памяти
```

### 12.9.3 Управление потоками
```python
class ThreadManager:
    def __init__(self):
        self.threads = []
    
    def create_thread(self, entry_point):
        thread = Thread(entry_point)
        self.threads.append(thread)
        return thread
    
    def run_threads(self):
        for thread in self.threads:
            thread.start()
            thread.join()
```

## 12.10 Система обработки исключений

### 12.10.1 Базовая структура
```python
class ExceptionHandler:
    def __init__(self):
        self.handlers = {}
    
    def register_handler(self, exception_type, handler):
        self.handlers[exception_type] = handler
    
    def handle_exception(self, exception):
        handler = self.handlers.get(type(exception))
        if handler:
            return handler(exception)
        raise exception
```

### 12.10.2 Обработка исключений
```python
class ExceptionHandler:
    def __init__(self):
        self.handlers = {}
    
    def register_handler(self, exception_type, handler):
        self.handlers[exception_type] = handler
    
    def handle_exception(self, exception):
        handler = self.handlers.get(type(exception))
        if handler:
            return handler(exception)
        raise exception
```

### 12.10.3 Обработка исключений системных вызовов
```python
class SystemCallError(Exception):
    pass

def handle_syscall_error(error_code):
    if error_code < 0:
        raise SystemCallError(f"Ошибка системного вызова: {error_code}")
```

### 12.10.4 Обработка исключений памяти
```python
class MemoryError(Exception):
    pass

def handle_memory_error(error_code):
    if error_code < 0:
        raise MemoryError(f"Ошибка памяти: {error_code}")
```

### 12.10.5 Обработка исключений потоков
```python
class ThreadError(Exception):
    pass

def handle_thread_error(error_code):
    if error_code < 0:
        raise ThreadError(f"Ошибка потока: {error_code}")
```

## 12.11 Масштабирование и оптимизация

### 12.11.1 Управление памятью
```python
class MemoryManager:
    def __init__(self, limit):
        self.limit = limit
        self.current = 0
        self.blocks = []
    
    async def allocate(self, size):
        if self.current + size > self.limit:
            await self.cleanup()
        self.current += size
        block = MemoryBlock(size)
        self.blocks.append(block)
        return block
```

### 12.11.2 Управление кучей
```python
class HeapManager:
    def __init__(self, start_addr, size):
        self.start = start_addr
        self.size = size
        self.blocks = [(start_addr, size, False)]  # (адрес, размер, используется)
    
    def allocate(self, size):
        # Алгоритм первого подходящего
        for i, (addr, block_size, used) in enumerate(self.blocks):
            if not used and block_size >= size:
                self.blocks[i] = (addr, size, True)
                if block_size > size:
                    # Разделить блок
                    self.blocks.insert(i + 1, 
                        (addr + size, block_size - size, False))
                return addr
        return None  # Нет свободной памяти
```

### 12.11.3 Управление потоками
```python
class ThreadManager:
    def __init__(self):
        self.threads = []
    
    def create_thread(self, entry_point):
        thread = Thread(entry_point)
        self.threads.append(thread)
        return thread
    
    def run_threads(self):
        for thread in self.threads:
            thread.start()
            thread.join()
```

## 12.12 Система обработки исключений

### 12.12.1 Базовая структура
```python
class ExceptionHandler:
    def __init__(self):
        self.handlers = {}
    
    def register_handler(self, exception_type, handler):
        self.handlers[exception_type] = handler
    
    def handle_exception(self, exception):
        handler = self.handlers.get(type(exception))
        if handler:
            return handler(exception)
        raise exception
```

### 12.12.2 Обработка исключений
```python
class ExceptionHandler:
    def __init__(self):
        self.handlers = {}
    
    def register_handler(self, exception_type, handler):
        self.handlers[exception_type] = handler
    
    def handle_exception(self, exception):
        handler = self.handlers.get(type(exception))
        if handler:
            return handler(exception)
        raise exception
```

### 12.12.3 Обработка исключений системных вызовов
```python
class SystemCallError(Exception):
    pass

def handle_syscall_error(error_code):
    if error_code < 0:
        raise SystemCallError(f"Ошибка системного вызова: {error_code}")
```

### 12.12.4 Обработка исключений памяти
```python
class MemoryError(Exception):
    pass

def handle_memory_error(error_code):
    if error_code < 0:
        raise MemoryError(f"Ошибка памяти: {error_code}")
```

### 12.12.5 Обработка исключений потоков
```python
class ThreadError(Exception):
    pass

def handle_thread_error(error_code):
    if error_code < 0:
        raise ThreadError(f"Ошибка потока: {error_code}")
```

## 12.13 Практическое применение

### 12.13.1 Создание мини-операционной системы
```python
class MiniOS:
    def __init__(self):
        self.memory_manager = MemoryManager(1024 * 1024)  # 1MB памяти
        self.thread_manager = ThreadManager()
        self.exception_handler = ExceptionHandler()
        self.syscall_handler = SystemCallHandler()
    
    async def boot(self):
        # Инициализация системы
        await self.memory_manager.initialize()
        self.thread_manager.initialize()
        self.setup_exception_handlers()
        
    def setup_exception_handlers(self):
        self.exception_handler.register_handler(
            SystemCallError, handle_syscall_error)
        self.exception_handler.register_handler(
            MemoryError, handle_memory_error)
        self.exception_handler.register_handler(
            ThreadError, handle_thread_error)
```

### 12.13.2 Пример использования
```python
async def main():
    # Создание экземпляра мини-ОС
    os = MiniOS()
    await os.boot()
    
    # Создание и запуск процесса
    process = await os.create_process("hello_world.bin")
    await process.run()
    
    # Обработка системных вызовов
    try:
        await process.write_to_console("Hello, World!")
    except SystemCallError as e:
        print(f"Ошибка вывода: {e}")

if __name__ == "__main__":
    asyncio.run(main())
```

## 12.14 Итоговый проект

### 12.14.1 Требования
1. Реализация базовой операционной системы
2. Управление процессами и потоками
3. Система обработки прерываний
4. Файловая система
5. Консольный интерфейс

### 12.14.2 План реализации
1. Создание базовой структуры
2. Добавление управления памятью
3. Реализация планировщика
4. Добавление системных вызовов
5. Создание файловой системы
6. Тестирование и отладка

### 12.14.3 Пример кода проекта
```python
class Project:
    def __init__(self):
        self.os = MiniOS()
        self.file_system = FileSystem()
        self.scheduler = Scheduler()
    
    async def initialize(self):
        await self.os.boot()
        await self.file_system.mount()
        self.scheduler.start()
    
    async def run_demo(self):
        # Создание файла
        with await self.file_system.create_file("/hello.txt") as f:
            await f.write("Hello from MiniOS!")
        
        # Создание процесса
        process = await self.os.create_process("user_program.bin")
        self.scheduler.add_process(process)
        
        # Запуск планировщика
        await self.scheduler.run()
```

## Заключение

В этой главе мы объединили все компоненты, изученные ранее, в единую систему. Мы увидели, как различные части компьютера работают вместе, как обрабатываются ошибки и исключения, и как создать простую, но функциональную операционную систему.

## Практические задания

1. Расширьте функциональность MiniOS:
   - Добавьте поддержку многозадачности
   - Реализуйте простую файловую систему
   - Создайте базовый планировщик процессов

2. Улучшите систему обработки ошибок:
   - Добавьте логирование
   - Реализуйте восстановление после сбоев
   - Создайте систему отладки

3. Оптимизируйте производительность:
   - Улучшите управление памятью
   - Оптимизируйте планировщик
   - Реализуйте кэширование

## Дополнительное чтение
- "Operating Systems: Three Easy Pieces" (Remzi H. Arpaci-Dusseau)
- "Modern Operating Systems" (Andrew S. Tanenbaum)
- "The Design and Implementation of the FreeBSD Operating System"

---

[← Предыдущая глава](#глава-11) | [К содержанию →](#содержание)

---

# Часть 2: Справочник FASM


# Справочник по FASM

Эта страница превращает текущий reference guide в формат книги для GitHub Pages.

## Полные главы

- [Полный Reference Guide]({{ '/reference-guide/' | relative_url }})
- [AI FASM Rules]({{ '/ai-fasm-rules/' | relative_url }})
- [Каталог примеров]({{ '/examples/' | relative_url }})

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
