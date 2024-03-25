[>] to the end of the string
<[ start from the end
 >+ add SALT to the accumulator
 the most reliable SALT values are primes except 2
 < back to char
 [>[>+>+<<-] multiply accumulator
  >[<+>-] copy it back
  <<- decrease the char
 ]
 >>>[<<<+>>>-] to the multiplied data and copy it to the char
 <<[-]<< to the next char and delete old accumulator
]> to the computed hash
