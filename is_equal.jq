#!/usr/bin/jq -rf

def is_equal($a; $b):
  $a == $b
;

[ 
  .[] |
  if is_equal(.[0]; .[1]) == .[2] then
    empty
  else
    "Failed \(.)"
  end
] | 
if length == 0 then
  ["All passed."]
else
  . + ["Missed \(length) tests"]
end | .[]
