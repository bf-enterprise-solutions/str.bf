[>]>[>]< ; to the end of the second string
[[>>+<<-]<] ; shift it two spaces right
>>>[>]< ; to the end of it again
[ ; spreading loop
 [[>+<-]<] ; shift the whole string to the right
 >>[<+>-] ; pinch the first char out of it
 >[>]< ; to the end of the string
] ; spreading loop ends
<[<<]<< ; to the end of the first string
[ ; interleaving loop
 >->>> ; to the second string first char (and leave a 255 beacon)
 [[<<+>>-]>>] ; copy the whole second string closer
 +[-<+] ; to the beacon
 <[>+<-] ; copy the lastmost char of the first string to the right
 >[>] ; to the end of contiguous segment of interleaving
 >[[>+<-]>>] ; copy all the spreadout cells to the right
 <[<<]<[[>+<-]<] ; to the contiguous segment and copy it right to free space
 < ; to the next last first string character (if any)
] ; interleaving loop ends
->>> ; to the string again (and leave 255 beacon)
; move it all back to the starting positions:
[[<<+>>-]>] ; first the contiguous part
>[[<<+>>-]>>] ; and then the spreadout part
+[-<+] ; to the beacon (and we're done)
