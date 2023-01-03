[>]< ; to the last char
[; strlen loop
 [>>+<<-] ; copy the char two cells right
 >+[<+>-] ; increment and copy the accumulator one cell left
 << ; to next char
] ; strlen loop ends
> ; to the accumulator/length cell
