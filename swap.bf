[>]>[>]< ; to the end of the second string
[[>>+<<-]<] ; move the second string to the left
<[[>>+<<-]<] ; move the first string too
>>>[>]> ; to the second string
[ ; copying loop
 [<<[<]<+>>[>]>-] ; char copy loop
 <<[[>+<-]<] ; copy the first string to the right to free some space
 >>[>]> ; to the next char
]
<<[<]> ; to the (new) second string beginning
[[<+>-]>] ; copy the (new) second string left
<<[<]<[<]> ; to the (new) first string beginning
