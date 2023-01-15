[]
[>]>[>]< ; to the second string end
[[>>+<<-]<]<[[>>+<<-]<] ; shift both strings to the right
+>>> ; set the equality flag and move to the start of the first string
include(interleave.bf)
[>] ; move until the zero cell
> ; to the next char (if any)
[ ; if there is a char (uneven lengths and spreadout cells)
 <<[<]<<< ; to the equality flag
 - ; kill it
 >>> ; back to the interleaved string
 include(deinterleave.bf)
 [>] ; to the end of the first string and exit
]
<<[<]<< ; to the equality flag
[ ; per character comparison block (sets up the memory for the actual loop)
 ;; TODO:
 ;; * increase every cell of the string
 ;; * copy the whole string to back it up
 ;; * compare every pair of characters
 ;;   * if equal then process to the next
 ;;   * if not equal then
 ;;     * delete all the string
 ;;     * remove the equality flag
 ;;     * and restore all the string from the copy
]
