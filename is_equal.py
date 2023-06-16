#!/usr/bin/env python3

import sys
import json

TEST_VECTORS = json.load(sys.stdin)
n_wrong = 0

def is_equal(a, b):
    return [type(a), type(b)].count(bool) != 1 and a == b

for test_vector in TEST_VECTORS:
    a, b, expected = test_vector
    if is_equal(a, b) != expected:
        print(f"Failed {test_vector}")
        n_wrong += 1

if n_wrong == 0:
    print("All passed.")
else:
    print(f"Missed {n_wrong} tests")
    exit(1)
