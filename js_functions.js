function js_int(a, b) {
    return a + b;
}

function js_float(a, b) {
    return a + b;
}

function js_str(a, b) {
    return a + b;
}

function js_bool(v) {
    return !v;
}

function js_null() {
    return 0;
}

module.exports = {
    js_int,
    js_float,
    js_str,
    js_bool,
    js_null
};