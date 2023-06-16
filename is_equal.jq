#!/usr/bin/jq -rf

def is_equal($a; $b): $a == $b;

# Compare each row and get failure messages
[ .[] | if is_equal(.[0]; .[1]) == .[2] then empty else "Failed \(.)" end ] |

# Generate output
if length == 0 then ["All passed."] else . + ["Missed \(length) tests"] end | .[]
