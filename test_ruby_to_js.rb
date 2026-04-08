require 'metacall'

metacall_load_from_file('node', ['js_functions.js'])

puts "=== Ruby -> JS ==="

r_int = metacall('js_int', 3, 4)
puts "[INT]   js_int(3, 4)        = #{r_int}   | expected: 7          | pass: #{r_int == 7}"

r_float = metacall('js_float', 1.5, 2.5)
puts "[FLOAT] js_float(1.5, 2.5)  = #{r_float} | expected: 4.0        | pass: #{r_float == 4.0}"

r_str = metacall('js_str', 'hello', 'world')
puts "[STR]   js_str(hello,world)  = #{r_str} | expected: helloworld | pass: #{r_str == 'helloworld'}"

r_bool = metacall('js_bool', true)
puts "[BOOL]  js_bool(true)        = #{r_bool}  | expected: false      | pass: #{r_bool == false}"

r_null = metacall('js_null')
puts "[NULL]  js_null()            = #{r_null}  | expected: 0          | pass: #{r_null == 0}"