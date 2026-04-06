def run_rb_caller
  py_result = metacall("py_greet", "Ruby")
  js_result = metacall("js_multiply", 6, 7)

  puts "[rb→py] #{py_result}"
  puts "[rb→js] #{js_result}"

  # Returning a hash ensures FaaS can send a proper JSON response
  { py_call: py_result, js_call: js_result }
end