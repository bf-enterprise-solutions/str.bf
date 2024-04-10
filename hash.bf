[>] to the end of the string
< move to last char (zeroed accumulator is the char after the last one)
[
 multiply the accumulator by SALT and add to the last char
 the most reliable SALT values are primes except 2
 in this case it's 3
 >[<+++>-]
 << to the next char
]> to the computed hash
if the string is a single character the hash is the character itself
