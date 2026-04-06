require "metacall"

metacall_load_from_file("py",   ["functions.py"])
metacall_load_from_file("node", ["functions.js"])

def run_rb_caller
  # Ruby → Python
  py_result = metacall("py_greet", "Ruby")
  puts "[rb→py] py_greet('Ruby') => #{py_result}"

  # Ruby → JS
  js_result = metacall("js_multiply", 6, 7)
  puts "[rb→js] js_multiply(6,7) => #{js_result}"

  { py: py_result, js: js_result }
end