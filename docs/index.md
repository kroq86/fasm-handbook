---
title: Home
permalink: /
---

<div class="hero">
  <h1>FASM Handbook</h1>
  <p>Examples, wrappers, and reference notes for learning Flat Assembler on Linux.</p>
  <p>This GitHub Pages site gives the repository a cleaner entry point than a single README and keeps the handbook content browsable online.</p>
</div>

## Choose Language

<div class="lang-grid">
  <div class="lang-card">
    <h3>English</h3>
    <p>Best default for GitHub discovery and a wider technical audience.</p>
    <p><a href="{{ '/en/' | relative_url }}">Open English overview</a></p>
    <p><a href="{{ '/book-en/' | relative_url }}">Open English handbook</a></p>
  </div>
  <div class="lang-card">
    <h3>Русский</h3>
    <p>Подходит для локальной аудитории и удобного чтения книги.</p>
    <p><a href="{{ '/ru/' | relative_url }}">Открыть русский обзор</a></p>
    <p><a href="{{ '/book-ru/' | relative_url }}">Открыть русскую книгу</a></p>
  </div>
</div>

## Recommended Publishing Strategy

- Use English as the main public landing language on GitHub.
- Keep Russian as a parallel handbook version for readability and teaching.
- Treat the repository README as the short project entry and GitHub Pages as the full handbook.

<div class="topic-box">
  <h2>Recommended GitHub Topics</h2>
  <ul class="topic-list">
    <li>fasm</li>
    <li>flat-assembler</li>
    <li>assembly</li>
    <li>x86-64</li>
    <li>linux</li>
    <li>elf64</li>
    <li>systems-programming</li>
    <li>low-level-programming</li>
    <li>assembler</li>
    <li>algorithms</li>
    <li>simd</li>
    <li>coroutines</li>
  </ul>
</div>

## What Is In The Repository

- Core include files for Linux syscalls and shared macros.
- Basic examples such as file I/O, arguments, Fibonacci, and two-sum.
- Advanced examples with Python and C wrappers.
- Reference notes and AI-oriented FASM coding rules.

<div class="note-box">
  <strong>GitHub Pages setup:</strong> in repository settings, set Pages to deploy from the <code>docs/</code> folder on the default branch.
</div>
