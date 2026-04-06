from metacall import metacall

def run_py_caller():
    js_result = metacall("js_multiply", 4, 5)
    rb_result = metacall("rb_shout", "world")

    print(f"[py→js] {js_result}")
    print(f"[py→rb] {rb_result}")

    # Returning a dictionary ensures FaaS can send a proper JSON response to the user
    return {"js_call": js_result, "rb_call": rb_result}