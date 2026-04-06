from metacall import metacall, metacall_load_from_file

metacall_load_from_file("node", ["functions.js"])
metacall_load_from_file("rb",   ["functions.rb"])

def run_py_caller():
    js_result = metacall("js_multiply", 4, 5)
    print(f"[py→js] js_multiply(4,5) => {js_result}")

    rb_result = metacall("rb_shout", "world")
    print(f"[py→rb] rb_shout('world') => {rb_result}")

    return { "js": js_result, "rb": rb_result }