[ ; reversal loop
 [<+>-]< ; copy the first char to the left
 [>>[>]>+<<[<]<-] ; char copy loop
 >>[[<+>-]>] ; copy the remaining string to the left
 <<[<]> ; to the first char again
] ; reversal loop end
>>[[<<+>>-]>] ; move the reversed sequence to the left
<<<[<]> ; get to the beginning of it
