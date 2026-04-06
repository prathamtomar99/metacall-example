# MetaCall N:N Cross-Language Boundary Demo

A proof-of-concept demonstrating **N:N cross-language function calls** using MetaCall.  
Every language acts as both a **caller and a callee** — built as a foundation for cross-language fuzzing research.

---

## What This Is

Most cross-language demos show 1:N — one language calling others.  
This project demonstrates **N:N** — every language calls every other language, across 3 hops:

```
main.py
  ├── run_py_caller()  [Python]
  │     ├── js_multiply()  [JavaScript]
  │     └── rb_shout()     [Ruby]
  │
  ├── run_js_caller()  [JavaScript]
  │     ├── py_add()       [Python]
  │     └── rb_shout()     [Ruby]
  │
  └── run_rb_caller()  [Ruby]
        ├── py_greet()     [Python]
        └── js_multiply()  [JavaScript]
```

---

## Project Structure

```
.
├── main.py          # Orchestrator
├── caller.py        # Python caller  → calls JS + Ruby
├── caller.js        # JS caller      → calls Python + Ruby
├── caller.rb        # Ruby caller    → calls Python + JS
├── functions.py     # Python functions  (py_add, py_greet)
├── functions.js     # JS functions      (js_multiply, js_shout)
└── functions.rb     # Ruby functions    (rb_shout, rb_square)
```

---

## File Roles

### `functions.*` — Define functions per language

| File | Language | Functions |
|------|----------|-----------|
| `functions.py` | Python | `py_add(a, b)`, `py_greet(name)` |
| `functions.js` | JavaScript | `js_multiply(a, b)`, `js_shout(text)` |
| `functions.rb` | Ruby | `rb_shout(text)`, `rb_square(n)` |

### `caller.*` — Each language calls 2 other languages

| File | Language | Calls Into |
|------|----------|-----------|
| `caller.py` | Python | `js_multiply` (JS), `rb_shout` (Ruby) |
| `caller.js` | JavaScript | `py_add` (Python), `rb_shout` (Ruby) |
| `caller.rb` | Ruby | `py_greet` (Python), `js_multiply` (JS) |

### `main.py` — Single entry point

- Loads all 3 caller files via MetaCall
- Triggers `run_py_caller()`, `run_js_caller()`, `run_rb_caller()` in sequence
- Each trigger causes a 3-hop cross-language call chain

---

## How to Run

```bash
metacall main.py
```

### Expected Output

```
==================================================
Trigger 1: main.py → caller.py → JS + Ruby
==================================================
[py→js] js_multiply(4,5) => 20
[py→rb] rb_shout('world') => WORLD!!!

==================================================
Trigger 2: main.py → caller.js → Python + Ruby
==================================================
[js→py] py_add(10,20) => 30
[js→rb] rb_shout('metacall') => METACALL!!!

==================================================
Trigger 3: main.py → caller.rb → Python + JS
==================================================
[rb→py] py_greet('Ruby') => Hello from Python, Ruby!
[rb→js] js_multiply(6,7) => 42
```

---

## Why This Matters

This demo is the **foundation for a cross-language fuzzer** being developed for GSoC 2026 under MetaCall.

| Concept | Role in Fuzzer |
|---------|---------------|
| `functions.*` | Fuzz targets — inputs are mutated here |
| `caller.*` | Boundary points — where type crossing happens |
| `main.py` | Fuzzer entry point — iterates all boundaries |
| N:N chain | Full boundary surface — catches bugs 1:N testing misses |

The key insight: bugs in cross-language systems often live **at the boundary**, not inside any single language. Testing N:N ensures every boundary is exercised in both directions.

---

## Dependencies

- [MetaCall](https://github.com/metacall/core) — polyglot runtime
- Python 3.x
- Node.js
- Ruby