const { metacall, metacall_load_from_file } = require("metacall");

metacall_load_from_file("py", ["functions.py"]);
metacall_load_from_file("rb", ["functions.rb"]);

function run_js_caller() {
    // JS → Python
    const py_result = metacall("py_add", 10, 20);
    console.log(`[js→py] py_add(10,20) => ${py_result}`);

    // JS → Ruby
    const rb_result = metacall("rb_shout", "metacall");
    console.log(`[js→rb] rb_shout('metacall') => ${rb_result}`);

    return { py: py_result, rb: rb_result };
}

module.exports = { run_js_caller };