[ ; reversal loop
 [<+>-]< ; copy the first char to the left
 [>>[>]>+<<[<]<-] ; copy the first char to after the string
 >>[[<+>-]>] ; copy the remaining string to the left
 <<[<]> ; to the first char again
] ; reversal loop end
>>[[<<+>>-]>] ; move the reversed sequence to the left
<<<[<]> ; get to the beginning of it
