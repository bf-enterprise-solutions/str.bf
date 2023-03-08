[>]< to the string end
[ duplication loop
 [>+>+<<-] duplicate the cell one cell right
 >[>]< to the end of the copies
 [[>+<-]<] move the copies one cell left to free space for next two copies
 < to the next copyable cell if any
] duplication loop ends
>>>[[<<+>>-]>] back to the sequence beginning and move it back (two cells left)
<<<[<]> back to the beginning
