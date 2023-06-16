#!/usr/bin/env node

function is_equal(a, b) {
    return a === b;
}

var fs = require('fs');
var test_vectors = JSON.parse(fs.readFileSync(0));
var n_wrong = 0;

for (tv in test_vectors) {
    [a, b, expected] = test_vectors[tv];
    if (is_equal(a, b) != expected) {
        console.log(`Failed ${JSON.stringify(test_vectors[tv])}`)
        n_wrong += 1;
    }
}

if (n_wrong == 0) {
    console.log("All passed.");
} else {
    console.log(`Missed ${n_wrong} tests`);
}
