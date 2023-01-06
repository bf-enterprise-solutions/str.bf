[]
>> ; to the string
[ ; char search loop
 << ; to the search char
 [>+>+<<-] ; compare & duplicate the search char
 >> ; to the compare char
 [ ; if not equal (nonzero)
  [<<<+>>>-] ; copy the remainder
  <[<+<+>>-] ; copy the duplicate search char (and complement the remainder)
  > ; back to compare char
 ] ; exit: it's empty now
 < ; to duplicate search char
 [ ; if equal (nonzero duplicate search char)
  ; (leave found char empty)
 ]
 <[>+<-] ; copy the duplicate duplicate search char back for next round
 >>> ; to the next compare char
] ; char search loop ends
