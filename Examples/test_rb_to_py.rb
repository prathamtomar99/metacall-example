MetaCallRbLoaderPort.metacall_load_from_file('py', ['py_functions.py'])

puts "=== Ruby -> Python ==="

r_int = MetaCallRbLoaderPort.metacall('py_int', 3, 4)
puts "[INT]   py_int(3, 4)        = #{r_int}   | expected: 7          | pass: #{r_int == 7}"

r_float = MetaCallRbLoaderPort.metacall('py_float', 1.5, 2.5)
puts "[FLOAT] py_float(1.5, 2.5)  = #{r_float} | expected: 4.0        | pass: #{r_float == 4.0}"

r_str = MetaCallRbLoaderPort.metacall('py_str', 'hello', 'world')
puts "[STR]   py_str(hello,world)  = #{r_str} | expected: helloworld | pass: #{r_str == 'helloworld'}"

r_bool = MetaCallRbLoaderPort.metacall('py_bool', true)
puts "[BOOL]  py_bool(true)        = #{r_bool}  | expected: false      | pass: #{r_bool == false}"

r_null = MetaCallRbLoaderPort.metacall('py_null')
puts "[NULL]  py_null()            = #{r_null}  | expected: 0          | pass: #{r_null == 0}"
