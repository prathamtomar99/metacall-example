from metacall import metacall, metacall_load_from_file

metacall_load_from_file("py",   ["caller.py"])   # py  → js, rb
metacall_load_from_file("node", ["caller.js"])   # js  → py, rb
metacall_load_from_file("rb",   ["caller.rb"])   # rb  → py, js

if __name__ == "__main__":

    print("=" * 50)
    print("Trigger 1: main.py → caller.py → JS + Ruby")
    print("=" * 50)
    metacall("run_py_caller")

    print()
    print("=" * 50)
    print("Trigger 2: main.py → caller.js → Python + Ruby")
    print("=" * 50)
    metacall("run_js_caller")

    print()
    print("=" * 50)
    print("Trigger 3: main.py → caller.rb → Python + JS")
    print("=" * 50)
    metacall("run_rb_caller")