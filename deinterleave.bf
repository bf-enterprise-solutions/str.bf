we start at the first cell (A1) of the sequence A1 B1 A2 B2 etc
[> move to the B cell
 [>>]<< move to the last B cell
 [[>>+<<-]<<] copy all the B cells one cell left
 >>> move to the next A cell
]
>[>>]<< move to the last B cell
[ compact the B sequence
 >>[[<+>-]>] copy the tail of the sequence to the left
 <<[<]< to the next non compacted cell
] B compacted
we're just after An now
< move to the last A
[ compact the A and move B sequences
 >>[[<+>-]>] copy the tail of the sequence to the left
 >[[<+>-]>] copy B sequence one cell to the left
 <<[<] to the start of B
 <<[<]< to the next non compacted A cell
] A compacted and B moved (we're done)
>> to the beginning of A
