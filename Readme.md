# MetaCall Polyglot Examples

6 working cross-language boundary tests: JS↔Python, JS↔Ruby, Python↔Ruby

## Run

metacall test_js_to_py.js 
metacall test_js_to_ruby.js
metacall test_py_to_js.py
metacall test_py_to_ruby.py
metacall test_ruby_to_py.rb
metacall test_ruby_to_js.rb

## Known Issues

- rb_null() returns Invalid/None across boundaries — Ruby loader bug in v0.9.20
- Ruby as caller requires MetaCallRbLoaderPort (not bare globals)
