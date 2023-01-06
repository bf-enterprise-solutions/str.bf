- ; decrease the counter (so that the case of counter = 1 terminates immediately)
[ ; repeat loop
 >>[>]< ; to the last char
 [>+>+<<-] ; duplicate it
 >[<+>-]>[<+>-] ; shift both copies
 <[<]< ; to the counter
 -] ; repeat loop until counter is zero
>>[[<<+>>-]>] ; shift the string to the left
<<<[<]> ; back to the beginning of the repeat string
