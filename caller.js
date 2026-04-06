const { metacall } = require("metacall");

function run_js_caller() {
    const py_result = metacall("py_add", 10, 20);
    const rb_result = metacall("rb_shout", "metacall");

    console.log(`[js→py] ${py_result}`);
    console.log(`[js→rb] ${rb_result}`);

    // Returning an object ensures FaaS can send a proper JSON response
    return { py_call: py_result, rb_call: rb_result };
}

module.exports = { run_js_caller };